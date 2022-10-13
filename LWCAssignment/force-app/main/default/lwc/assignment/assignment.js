import { LightningElement, track } from 'lwc';
import getObjectName from '@salesforce/apex/Assignment.getObjectName';
import Generatequery from '@salesforce/apex/Assignment.Generatequery';
import getAllFields from '@salesforce/apex/Assignment.getAllFields';


export default class Assignment extends LightningElement {
value = 'inProgress';
@track value='';
@track options;
@track fields='';
@track query=[];
@track data='';
@track stringQuery='';
@track column=[];

    connectedCallback(){
        getObjectName()
        .then(result => {
            this.options = result;
        })
        .catch(error => {
            console.log(error);
        });
    }

//create handle change method
    handleChange(event){
        this.value= event.detail.value;
        getAllFields({
            obj: event.detail.value
        }).then(result => {
            this.fields = result;
        })
        .catch(error => {
            console.log(error);
        });
    }

    // create clickHandleChange method
    clickHandleChange(event){
        this.query = event.detail.value;
        var feildNames = this.query.join(','); 
        this.stringQuery='SELECT '+feildNames+' FROM '+this.value;
    }

    // create handleClick method created onClick of button
    handleClick(){
        var filedsArr = this.query;
        var columnData = [];
        for(var i=0; i<filedsArr.length; i++){
            var fieldObj = {};
            fieldObj.label = filedsArr[i];
            fieldObj.fieldName = filedsArr[i];
            columnData.push(fieldObj);
        }
        this.column = columnData;
        Generatequery({
            records:this.stringQuery
        })
        .then(result =>{
            this.data =result;
            //
        })
        .catch(error =>{
            console.log(error);
        })

    }

}