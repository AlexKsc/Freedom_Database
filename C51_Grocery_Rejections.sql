
select r.batch_id,count(distinct r.receipt_id),rcrr.key
from receipts r
         join receipt_requests rr using (receipt_id)
         join receipt_request_rejection rrr on rrr.receipt_request_id = rr.request_id
         join receipt_claim_rejection_reasons rcrr on rcrr.id = rrr.receipt_claim_rejections_reason_id
where r.batch_id IN (438,439) and rcrr.key = "request_rejected_item_not_found"
GROUP BY r.batch_id
ORDER BY r.batch_id;