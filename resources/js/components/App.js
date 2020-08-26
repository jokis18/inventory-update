import React, { Component } from 'react';
import ReactDOM from 'react-dom';
// import { BrowserRouter, Route, Switch } from 'react-router-dom';
// import Index from './Index';
// import Pagination from "react-js-pagination";

import enTranslations from '@shopify/polaris/locales/en.json';

import '@shopify/polaris/dist/styles.css';
import { CSVLink, CSVDownload } from "react-csv";
import {
AppProvider, 
Thumbnail, 
Page,  
Card,  
TextField, 
Form,
Avatar, 
Tabs, 
Icon,
ResourceList, 
ResourceItem, 
Heading, 
Banner,
ActionList, 
Button,
Popover, 
FormLayout,
DropZone,
Checkbox,
Spinner,
Caption,
Link,Toast,Frame,TextStyle,Stack,Pagination
} from '@shopify/polaris';
class App extends Component {

  constructor () {
    super()
    this.state = {
    header: true,
    csv_file: "",
    file_name: '',
    loading: false,
    active: false,
    message: 'Upload CSV Successfully',
    selected: 0,
    tabchange: true,
    isloading: true,
    variants:[],
    selectedItems: [],
    disabled: true,
    btnload: false,
    data:[],
    activePage: 1,
    since_id: 0,
    prev_id: 0,
    hasPrevious: false,
    hasNext: true,
    pagefirst: 1,
    pagelast: 1,
    sesson_id:[],
    message2:'It will takes approximately one minute or more time to update'
    },
    this.csvLink = React.createRef()
    this.handlefileChange = this.handlefileChange.bind(this)
    this.handleheaderChange = this.handleheaderChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.toggleActive = this.toggleActive.bind(this)
    this.handleTabChange = this.handleTabChange.bind(this)
    this.addvrntfield = this.addvrntfield.bind(this)
    this.setSelectedItems = this.setSelectedItems.bind(this)
    this.saveexport = this.saveexport.bind(this)
    this.handlePageChange =this.handlePageChange.bind(this)
    this.onprevius = this.onprevius.bind(this)
    this.onnext = this.onnext.bind(this)
  }

  handlePageChange(pageNumber){
    this.setState({activePage: pageNumber});
  }
  handleTabChange(e){
    if(e === 0){
      this.setState({tabchange: true, selected: 0});
    }else{
      this.setState({tabchange: false, selected: 1});
    }
  }
  addvrntfield (id){

  }
  toggleActive(){
    this.setState({
      active: !this.state.active
    });
  }
  handlefileChange(e){
    this.setState({ file_name : e[0]});
    this.createImage(e[0]);
  }
  onnext(id){
    this.state.pagefirst++;
    var countfirst = this.state.pagefirst;
    if(countfirst >= this.state.pagelast){
      this.setState({ hasNext: false});
    }
    this.setState({ isloading: true, pagefirst: countfirst});
    this.getvariants(id, this.state.pagefirst);
  }
  onprevius(id){
    this.state.pagefirst--;
    var countfirst = this.state.pagefirst;
   // console.log('count '+countfirst);
    var ids = 0;
    if(countfirst > 1){
      var index = countfirst -2;
     // console.log('index '+index);
     // console.log(this.state.sesson_id);
      ids = this.state.sesson_id[index]
    }else{
      ids = 0;
    }
  //  console.log('id '+ids);
    if(countfirst < this.state.pagelast){
      this.setState({ hasNext: true});
    }

    this.setState({ isloading: true, pagefirst : countfirst});
    this.getvariants(ids, this.state.pagefirst);
  }
  createImage(file) {
    let reader = new FileReader();
    reader.onload = (e) => {
      this.setState({
        csv_file: e.target.result
      })
    };
    reader.readAsDataURL(file);  
  }

  handleheaderChange(event){
    this.setState({
      header: !this.state.header
    });
  }

  handleSubmit(event){
    event.preventDefault();
    const formData = {file: this.state.csv_file, header: this.state.header}
    if(this.state.csv_file ==''){
      this.setState({active: true,message: 'Please select csv file'});
    }else{
      this.setState({loading: true});
      ///reactshopify/public
      axios.post('import_csv', formData).then(response => {
        if(response.data == 'Done this process'){
          this.setState({message: 'Upload CSV Successfully. It will takes approximately one minute or more time to update.'});
        }else{
         this.setState({message: 'File Not Uploaded'}); 
        }
        this.setState({loading: false, active: true, csv_file: '', file_name: ''});
      })
    } 
  }
  setSelectedItems(ev){
    if(ev.length ==0){
      this.setState({
        selectedItems: ev,
        disabled: true
      })
    }else{
      this.setState({
        selectedItems: ev,
        disabled: false
      })
    }
  }

  saveexport(){
    this.setState({ btnload: true, isloading: true });
    const { selectedItems, variants } = this.state;
      axios.post('ExportCSV', {selectedItems}).then(response => {
        this.setState({ btnload: false,disabled: false, data: response.data, isloading:false, selectedItems:[] });
        this.csvLink.current.link.click()
    })
  }

  getvariants(since_ids, page){
    if(page <=1){
      this.setState({ hasPrevious: false});
    }else{
      this.setState({ hasPrevious: true});
    }
    var sesson_ids = this.state.sesson_id;

    axios.post('allvariants',{'since_id':since_ids}).then(response => {
      var snc_id=0;
      response.data.variants.map((variant, i) => { 
          snc_id = variant.id; 
      })
      if(sesson_ids.indexOf(snc_id) !== -1){} else{
          sesson_ids.push(snc_id);
      }
      
      if(response.data.count <= 1){
        this.setState({ hasNext: false});
      }
      this.setState({
        isloading: false,
        variants: response.data.variants,
        since_id: snc_id,
        pagelast:response.data.count,
        sesson_id: sesson_ids
      })
    })
  }
  componentDidMount () {
    this.getvariants(this.state.since_id, 1);
  }
  renderItem(item) {
    const {id, sku,title} = item;
    const media = <Avatar customer size="medium" name={title} />;
    return (
      <ResourceItem
        id={id}
        media={media}
        accessibilityLabel={`View details for ${title}`}
      >
      <div onClick={() => this.addvrntfield (variant_id)} >
        <h3>
          <TextStyle variation="strong">{title}</TextStyle>
        </h3> 
        <p>{sku}</p>  
        </div>         
      </ResourceItem>
    );
  }
      render () {
         const {message2,hasPrevious,hasNext,since_id,activePage,active,message,csv_file,file_name,selected,header,loading,isloading,variants,tabchange,selectedItems,btnload,disabled,data} = this.state;
         //console.log(hasNext);
         //console.log(hasPrevious);
         const tabs = [
            {
              id: 'all-customers',
              content: 'All Variants',
              accessibilityLabel: 'All customers',
              panelID: 'all-customers-content',
            },
            {
              id: 'accepts-marketing',
              content: 'Import CSV',
              panelID: 'accepts-marketing-content',
            },
          ];
        const toastMarkup = active ? (
    <Toast content={message} onDismiss={this.toggleActive} duration={5000}/>
  ) : null;
   const toastMarkup2 = active ? (
    <Toast content={message2} onDismiss={this.toggleActive} duration={5000}/>
  ) : null;
        const link = (<Link size="large" url="https://netzilatechnologies.com/reactshopify/public/csv/sample.csv" external>Sample CSV File</Link>);
        const fileUpload = !this.state.csv_file && <DropZone.FileUpload />;

        const uploadedFile = csv_file && (<Stack><Thumbnail
            size="small"
            alt={file_name.name}
            source='https://cdn.shopify.com/s/files/1/0757/9955/files/New_Post.png?12678548500147524304'
            />
            <div>
              {file_name.name}
            </div>
          </Stack>
      );
        return (
          <AppProvider i18n={enTranslations}>
            <Frame>
            <Page title="Import & Export CSV" primaryAction={{content: 'Export CSV', disabled: disabled, loading: btnload, onClick: () => this.saveexport()}}>
              
              { tabchange ?(<Card subdued>
                <Tabs tabs={tabs} selected={selected} onSelect={this.handleTabChange}>
                <Card.Section>
                  <CSVLink
                    data={data}
                    filename="export.csv"
                    className="hidden"
                    ref={this.csvLink}
                    target="_blank" 
                 />
                  <ResourceList
                    resourceName={{singular: 'variant', plural: 'variants'}}
                    items={variants}
                    selectedItems={selectedItems}
                    onSelectionChange={this.setSelectedItems}
                    selectable
                    renderItem={this.renderItem}
                    loading={isloading}
                  />
                  <div className="paginat">
                  <Pagination
                    hasPrevious={hasPrevious}
                    onPrevious={() => {this.onprevius(since_id)}}
                    hasNext={hasNext}
                    onNext={() =>{this.onnext(since_id)}}
                  /></div>
                </Card.Section>
              </Tabs>
              </Card>
              ) :(
              <Card sectioned>
                <Tabs tabs={tabs} selected={selected} onSelect={this.handleTabChange}>
              <Card.Section>
                <Form onSubmit={this.handleSubmit}>
                <FormLayout>
                  <DropZone 
                  allowMultiple={false}
                  accept=".csv"
                          errorOverlayText="File type must be .csv"
                          type="file" 
                  onDrop={(ev) => {this.handlefileChange(ev)}}>
                  {uploadedFile}
                  {fileUpload}
                </DropZone>
                  <Checkbox
                    label="File contains header row?"
                    checked={header}
                    onChange={this.handleheaderChange}
                  />
                  <Button primary submit loading={loading}>Submit</Button>
                  {toastMarkup}
                </FormLayout>
              </Form>
              </Card.Section>
              </Tabs>
              </Card>)}
            </Page>
            </Frame>
          </AppProvider>
        )
    }
}

ReactDOM.render(<App />, document.getElementById('app'));
// if (document.getElementById('example')) {
    
// }
