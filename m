Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB09F12B30B
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EC56E1D5;
	Fri, 27 Dec 2019 08:14:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690045.outbound.protection.outlook.com [40.107.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA1E6E2E8;
 Fri,  1 Nov 2019 19:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbnMUrgCcfvsYZj3jZiyXZsfAjm8HeSUMP5NNZVte9UH+K0SOk5jYeFZtJbpuXqhKqiFplPQnNNRcXSGpWj/EwUsfLpt+Pt8x8laF6+LoAiU9QQBKdQRAfyfpX6xYtJ7LaN8Py3GPuVidjRtze6lBbqdI6wpNP282Wd98Ny7on60jaS5MfIihqKDAwnjdyac5wPHcrY8IDQULNI0BBy87QKR4Tv9HoWG6STn3DqGVhrBjgmolc0ss5n92D+YP7mW0CRXpL4NdQG4ayjvi6zPVLdBrilohtwVAcAnH7AO4G1tt9Ec3UEDpDGhiYL1KXvu19iy5xkHSsUyG2p1gYZ7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6ng1eFzOPjyGk61V9A5M5rQ6aMj9rG68kA5xXa/boM=;
 b=gzRKXbS1R9uUlAwUCe2xbkZ7xw3SJZIYWMJK4+q+qMw1aVhM/E89tYL7YOKhNkdtuTyU1c9teC/v6CUspEhAcaOCRAJdBTFVv96M5d+hpoasev2k/qWj66Bfk50HL1Twf8jG+7ShcqhONfG24ZIajKCmmIu5D8HGc4iT2FNcr39B6vd7+p5+/QhoSTd7xcZNnD7cHqmbE1Wluf+7VFMXksRWeZ6f0O+Cy6rtdvSbIxRgv4bfhGrtt+zEhCRbvIltvLh7Wukro8bgN3q7luB7ffQeusU3zSDX/k24thZinBSDl/itPFjq+wY/qAE052vVu2tNcW/2J4Y65WUhu19QAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6ng1eFzOPjyGk61V9A5M5rQ6aMj9rG68kA5xXa/boM=;
 b=xW8FonpoXI5EDW0HOyjVveKexJrCuJQoe6iTmDZn0JVOBDxyN5634dI5Klb+FEJk9Un+ML/6DPWn5QfdnBrCA7AjsJ289uaEoPTWlAPoOrawvAQIfMpZQhpXvG91FX3s+es2dIP5tksPsiRr4q1d77tHa6KoZMubFvtAIweqB0A=
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3005.namprd12.prod.outlook.com (20.178.241.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 19:45:22 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 19:45:22 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AIAAB7mAgAANHgCAABzRAIAAIk6A
Date: Fri, 1 Nov 2019 19:45:22 +0000
Message-ID: <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
 <20191101174221.GO22766@mellanox.com>
In-Reply-To: <20191101174221.GO22766@mellanox.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16257bc4-a1e0-4e3e-08d5-08d75f04082a
x-ms-traffictypediagnostic: MN2PR12MB3005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3005AEDBF9270C73A2F2EB89E6620@MN2PR12MB3005.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(199004)(189003)(99286004)(446003)(11346002)(86362001)(2616005)(476003)(76176011)(478600001)(52116002)(31686004)(386003)(6506007)(53546011)(71200400001)(4326008)(71190400001)(64756008)(66446008)(66946007)(66556008)(66476007)(14454004)(102836004)(26005)(256004)(25786009)(14444005)(486006)(36756003)(186003)(31696002)(66066001)(8676002)(229853002)(2906002)(6512007)(81166006)(54906003)(6246003)(8936002)(6486002)(6436002)(6116002)(3846002)(316002)(81156014)(7416002)(6916009)(305945005)(5660300002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3005;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oo0hFaaW2PJY9SpKfNXyacnczN/0DWfGGQcNXHUT/wSbKXTTLJeLPXZWYljLpJxu2yXMmZB3fLjmR1aAIEUq4AYvZ3kRI9tIIvAG2IAvNULdwkdKUxJt/jQ953ijzriNgSs4OlCdd/zbIzB37CZzyt+jzn9JA5rO3aQZtYxRGsOZ+PbGewyoVDR/TMavyUxk9J8UwdsIUURMCN0XbZRa9Uj3TMiAeQgxdAMpA/HBVXxXlLAonzSX2fWSn67ykju58vdSVJ2VQc1tp64k53b92cXBOBV3mjOlqpbUvXIgtOXMtOJkHrDHA6szCeRu77biFn208wDf61kbTpaa7o9q3Kw9qVo0lfiFNhRKyEv1yEXg4XK7PXiJjZYTuOmEXOEXUuPsTIMvRoeT+tfbkjdCPa6Xi0vE6lHpPNr7C29ebZOCzTC3GfiszEb71oFO3FVl
Content-ID: <70389B827339AC4C803740DD25F675F6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16257bc4-a1e0-4e3e-08d5-08d75f04082a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:45:22.0393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7/Hjoc7x454oZUChB905mGApsaqrZyaB+wbFEGwn0/hxvmwPdOZONpO4QnH5hOb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3005
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier
 instead of hmm_mirror
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 2019-11-01 1:42 p.m., Jason Gunthorpe wrote:
> On Fri, Nov 01, 2019 at 03:59:26PM +0000, Yang, Philip wrote:
>>> This test for range_blockable should be before mutex_lock, I can move
>>> it up
>>>
>> yes, thanks.
> 
> Okay, I wrote it like this:
> 
> 	if (mmu_notifier_range_blockable(range))
> 		mutex_lock(&adev->notifier_lock);
> 	else if (!mutex_trylock(&adev->notifier_lock))
> 		return false;
> 
>>> Also, do you know if notifier_lock is held while calling
>>> amdgpu_ttm_tt_get_user_pages_done()? Can we add a 'lock assert held'
>>> to amdgpu_ttm_tt_get_user_pages_done()?
>>
>> gpu side hold notifier_lock but kfd side doesn't. kfd side doesn't check
>> amdgpu_ttm_tt_get_user_pages_done/mmu_range_read_retry return value but
>> check mem->invalid flag which is updated from invalidate callback. It
>> takes more time to change, I will come to another patch to fix it later.
> 
> Ah.. confusing, OK, I'll let you sort that
> 
>>> However, this is all pre-existing bugs, so I'm OK go ahead with this
>>> patch as modified. I advise AMD to make a followup patch ..
>>>
>> yes, I will.
> 
> While you are here, this is also wrong:
> 
> int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
> {
> 	down_read(&mm->mmap_sem);
> 	r = hmm_range_fault(range, 0);
> 	up_read(&mm->mmap_sem);
> 	if (unlikely(r <= 0)) {
> 		if ((r == 0 || r == -EBUSY) && !time_after(jiffies, timeout))
> 			goto retry;
> 		goto out_free_pfns;
> 	}
> 
> 	for (i = 0; i < ttm->num_pages; i++) {
> 		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
> 
> It is not allowed to read the results of hmm_range_fault() outside
> locking, and in particular, we can't convert to a struct page.
> 
> This must be done inside the notifier_lock, after checking
> mmu_range_read_retry(), all handling of the struct page must be
> structured like that.
> 
Below change will fix this, then driver will call mmu_range_read_retry 
second time using same range->notifier_seq to check if range is 
invalidated inside amdgpu_cs_submit, this looks ok for me.

@@ -868,6 +869,13 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo 
*bo, struct page **pages)
                 goto out_free_pfns;
         }

+       mutex_lock(&adev->notifier_lock);
+
+       if (mmu_range_read_retry(&bo->notifier, range->notifier_seq)) {
+               mutex_unlock(&adev->notifier_lock);
+               goto retry;
+       }
+
         for (i = 0; i < ttm->num_pages; i++) {
                 pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
                 if (unlikely(!pages[i])) {
@@ -875,10 +883,12 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo 
*bo, struct page **pages)
                                i, range->pfns[i]);
                         r = -ENOMEM;

+                       mutex_unlock(&adev->notifier_lock);
                         goto out_free_pfns;
                 }
         }

+       mutex_unlock(&adev->notifier_lock);
         gtt->range = range;
         mmput(mm);

Philip

>>>> @@ -997,10 +1004,18 @@ static void amdgpu_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
>>>>    	sg_free_table(ttm->sg);
>>>>    
>>>>    #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
>>>> -	if (gtt->range &&
>>>> -	    ttm->pages[0] == hmm_device_entry_to_page(gtt->range,
>>>> -						      gtt->range->pfns[0]))
>>>> -		WARN_ONCE(1, "Missing get_user_page_done\n");
>>>> +	if (gtt->range) {
>>>> +		unsigned long i;
>>>> +
>>>> +		for (i = 0; i < ttm->num_pages; i++) {
>>>> +			if (ttm->pages[i] !=
>>>> +				hmm_device_entry_to_page(gtt->range,
>>>> +					      gtt->range->pfns[i]))
>>>> +				break;
>>>> +		}
>>>> +
>>>> +		WARN((i == ttm->num_pages), "Missing get_user_page_done\n");
>>>> +	}
>>>
>>> Is this related/necessary? I can put it in another patch if it is just
>>> debugging improvement? Please advise
>>>
>> I see this WARN backtrace now, but I didn't see it before. This is
>> somehow related.
> 
> Hm, might be instructive to learn what is going on..
> 
> Thanks,
> Jason
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
