import { LightningElement, api } from 'lwc';

export default class LeadFormLWR extends LightningElement {
    @api recordId
    @api invoke() {
        console.log("invoked", this.recordId)
        window.open("https://nerdmuscleclub-dev-ed.trailblaze.my.site.com", "_blank")
    }
}