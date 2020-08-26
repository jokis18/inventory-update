<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use Response;
class ShopifyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $shop = Auth::user();
        $domain = $shop->getDomain()->toNative();
        //$shopApi = $shop->api()->rest('GET', '/admin/products.json', ['limit'=>250, 'fields'=>'id', 'since_id'=>0])['body']['products'];
        // $request = $shop->api()->graph('{ shop { products(first: 3) {edges { node { id}} }}}');
        // echo "<pre>";
        // print_r($request['body']);
        // die;
        return view('welcome');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $shop = Auth::user();
        $shop_domain = $shop->getDomain()->toNative();
       
       // logger($request->get('file'));
        if($request->get('file'))
        {
            $file = $request->get('file');
            $file = fopen($file, "r");
            //$path = $request->file('file')->getRealPath();
            $header = $request->get('header');
            // if($header == true){
            //     $data = 1;
            // }else{
            //     $data = 0; 
            // }
            $filename = base_path('resources/csv/'.$shop_domain.'.csv');
            if(file_put_contents($filename, $file)){
                 $message = 'Done';
            }else{
               $message = 'Not Done'; 
            }
            // while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {
            //     logger($column);
                
            // }
            //loop through file and split every 1000 lines
            // $parts = (array_chunk($data, 1000));
            // foreach($parts as $key=>$line) {
            //     $filename = base_path('resources/csv/'.$shop_domain.'.csv');
            //     file_put_contents($filename, $line);
            // }
            $shop->header = $header;
            $shop->execute = 1;
            $shop->save();
             return response()->json($message);
        }
      //  
       // Session::flash('message', 'CSV upload successfully'); 
      //  return redirect("/");
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $shop = Auth::user();
        $domain = $shop->getDomain()->toNative();
        $since_id = $request->get('since_id');
        if($since_id == ''){
            $since_id = 0;
        }
        $count = $shop->api()->rest('GET', '/admin/variants/count.json', [])['body']['count'];
        $variants = $shop->api()->rest('GET', '/admin/variants.json', ['limit' => 25, 'since_id' =>$since_id])['body']['variants'];
        if ($count > 0){
            $page = ceil((int)$count / 25);
        }
        return response()->json(['variants' => $variants, 'count' =>$page]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $shop = Auth::user();
        $domain = $shop->getDomain()->toNative();
        $variants = $request->get('selectedItems');
        $headers = array(
           "Content-type" => "text/csv",
           "Content-Disposition" => "attachment; filename=file.csv",
           "Pragma" => "no-cache",
           "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
           "Expires" => "0"
        );
        $columns = array('sku', 'price', 'quantity', 'compare_at_price');
        $callback = function() use ($variants, $columns, $shop)
        {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns);
            foreach($variants as $variant) {
              $variant_invt = $shop->api()->rest(
                      'GET',
                      '/admin/variants/'.$variant.'.json',
                      []
                  )['body']['variant'];
                fputcsv($file, array($variant_invt->sku, $variant_invt->price, $variant_invt->inventory_quantity, $variant_invt->compare_at_price));
           }
           fclose($file);
        };
        return Response::stream($callback, 200, $headers);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
