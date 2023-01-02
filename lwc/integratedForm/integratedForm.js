import { LightningElement, api} from 'lwc';

export default class IntegratedForm extends LightningElement {
    @api recordId
    @api invoke() {
        console.log("invoked", this.recordId)
        window.open("https://docs.google.com/forms/d/e/1FAIpQLScloNKIav3dk678Wso4l2-ln56mBqQMXYYl1wfljAiKhgLPQg/viewform", "_blank")
    }
}