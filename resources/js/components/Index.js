import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import enTranslations from '@shopify/polaris/locales/en.json';
import '@shopify/polaris/dist/styles.css';
import {
AppProvider, 
ResourceList,
Thumbnail, 
ResourceItem, 
Page, 
Layout, 
Card, 
TextStyle, 
TextField, 
Form,
Avatar, 
Tabs, 
Icon,
Stack, 
Badge, 
Heading, 
Banner,
ActionList, 
Button,
Popover, 
FormLayout,
DropZone,
Checkbox,
Spinner,
Caption
} from '@shopify/polaris';
class Index extends Component {
	constructor () {
		super()
		this.state = {
		header: true,
		csv_file: "",
		loading: false
	},
		this.handlefileChange = this.handlefileChange.bind(this)
		this.handleheaderChange = this.handleheaderChange.bind(this)
		this.handleSubmit = this.handleSubmit.bind(this)
	}
	handlefileChange(e){
		console.log(e);
		this.createImage(e[0]);
	//let files = event.target.files || event.dataTransfer.files;
    //this.createImage(event[0]);
	}
	createImage(file) {
      let reader = new FileReader();
      reader.onload = (e) => {
      	console.log(e);
        this.setState({
          csv_file: e.target.result
        })
      };
      reader.readAsDataURL(file);  
    }

	handleheaderChange(event){
	console.log(event);
		this.setState({
      header: !this.state.header
    });
	}
	handleSubmit(event){
		event.preventDefault();

		this.setState({loading: true})
	    const formData = {file: this.state.csv_file, header: this.state.header}
	    axios.post('/import_csv', formData).then(response => {
	        this.setState({loading: false})
        	ShopifyApp.flashNotice("File Upload successfully");
      })
	}
      render () {
      	const fileUpload = !this.state.csv_file && <DropZone.FileUpload />;
      	const uploadedFile = this.state.csv_file && (<Stack><Thumbnail
		        size="small"
		        alt={this.state.csv_file.name}
			      />
			      <div>
			        {this.state.csv_file.name}
			      </div>
			    </Stack>
		  );
        return (
	        <AppProvider>
	        	<Page>
		        	<Card title="CSV Import" sectioned>
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
					          checked={this.state.header}
					          onChange={this.handleheaderChange}
					        />
					        <Button primary submit loading={this.state.loading}>Submit</Button>
					      </FormLayout>
					    </Form>
		        	</Card>
		        </Page>
	        </AppProvider>
        )
    }
}
export default Index;