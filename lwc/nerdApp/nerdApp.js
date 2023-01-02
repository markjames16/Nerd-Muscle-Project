import { LightningElement } from 'lwc';
import NDA_IMAGES from '@salesforce/resourceUrl/NerdMUSCLEAPP1'
import NDA_IMAGES2 from '@salesforce/resourceUrl/NerdMUSCLEAPP2'
import NDA_IMAGES3 from '@salesforce/resourceUrl/NerdMUSCLEAPP3'
export default class NerdApp extends LightningElement {

    nerdImages1 = NDA_IMAGES;
    nerdImages2 = NDA_IMAGES2;
    nerdImages3 = NDA_IMAGES3;

}