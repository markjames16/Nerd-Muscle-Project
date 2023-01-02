import { LightningElement,api} from 'lwc';

export default class WebToLeadForm extends LightningElement {
    @api recordId
    @api invoke(){
        console.log("invoked", this.recordId);
        window.open("http://nerdmuscleclubinquiry.c1.biz", "_blank")
    }
}