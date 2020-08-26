<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File; 
use Illuminate\Support\Facades\Auth;
use App\User;
class InventoryUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'invetory:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update all variants';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        logger('Update all variants cron');
        
        $shops = User::where('execute', 1)->get();
        //logger(json_encode($shops));
        $api_key= env('SHOPIFY_API_KEY');
        $api_version = env('SHOPIFY_API_VERSION');
        foreach($shops as $shop){
            if($shop->process == 0){
                $shop->execute = 0;
                $shop->process = 1;
                $shop->save(); 
                // Api details
                $api_secret= $shop->password;
                $shop_domain=$shop->getDomain()->toNative();
                $file_name = base_path('resources/csv/'.$shop_domain.'.csv');
               // Count Shopify products
                if(file_exists($file_name)){
                    $count = $shop->api()->rest('GET', '/admin/api/'.$api_version.'/products/count.json')['body']['count'];
                    //Get all products
                    if ($count > 0){
                        $page = ceil((int)$count / 250);
                        $since_id = 0;
                        for ($i=1; $i<=$page; $i++) {
                            if($i ==1){
                                sleep(1);
                                $products = $shop->api()->rest('GET', '/admin/api/'.$api_version.'/products.json', ['limit'=>250, 'fields'=>'id,variants', 'since_id'=>$since_id])['body']['products'];
                            }else{
                                $products = $shop->api()->rest('GET', '/admin/api/'.$api_version.'/products.json', ['limit'=>250, 'fields'=>'id,variants', 'since_id'=>$since_id])['body']['products'];
                            }
                           
                            foreach($products as $keys => $product){
                                $since_id = $product->id;
                                $all_products[] = $product;
                            }
                        }
                    }
                    
                    // Read csv  file
                    $file = fopen($file_name, "r");
                    $key = 1;
                    $head = false;
                    while (($column = fgetcsv($file)) !== FALSE) {
                        if($shop->header == 1){
                            if($key == 1){
                                $head= false;
                            }else{
                                $head= true;
                            }
                        }else{
                            $head= true;
                        }
                        if($head){
                            $sku = "";
                            if (isset($column[0])) {
                                $sku = $column[0];
                            }
                            $price = "";
                            if (isset($column[1])) {
                                $price = $column[1];
                            }
                            $qantity = "";
                            if (isset($column[2])) {
                                $qantity = $column[2];
                            }
                            $compare_at_price = "";
                            if (isset($column[3])) {
                                $compare_at_price = $column[3];
                            }
                            //Compare csv and shopify variants
                            foreach($all_products as $keys => $product){
                                foreach($product->variants as $key => $variant){
                                    if($variant->sku == $sku){
                                        $inventry_Qantity = $shop->api()->rest('GET', '/admin/api/'.$api_version.'/inventory_levels.json', ['inventory_item_ids'=>$variant->inventory_item_id])['body'];
                                        $inventry_level = $inventry_Qantity->inventory_levels[0];
                                       
                                        $quantitys =  array('location_id' => $inventry_level->location_id,'inventory_item_id' => $inventry_level->inventory_item_id, 'available' =>$qantity);
                                        sleep(1);
                                        $update_inventry_Qantity = $shop->api()->request('POST', '/admin/api/'.$api_version.'/inventory_levels/set.json', $quantitys);

                                        //Update Price 
                                        $products_array = array('variant' => array('id' => $variant->id,'price' => $price,'compare_at_price'=>$compare_at_price));
                                        sleep(1);
                                        $update_price = $shop->api()->request('PUT', '/admin/api/'.$api_version.'/variants/'.$variant->id.'.json', $products_array);  
                                    }
                                }
                            }
                        }
                        $key++;
                    }
                    fclose($file);
                    File::delete($file_name);
                }else{
                    logger("File not exists");
                }
            }
            $shop->process = 0;
            $shop->save();
        }
    }
}
