using {rdl as gen} from '../db/rdl-data-model';
using {rdl as ovp} from '../db/overview-data';

service RDLOverviewService {
    @readonly
    entity Classes as projection on ovp.ClassOverview;
}