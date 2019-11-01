Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CCA12B308
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACEF6E33E;
	Fri, 27 Dec 2019 08:14:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680053.outbound.protection.outlook.com [40.107.68.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06D96E24E;
 Fri,  1 Nov 2019 15:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb0vaTjrjgp43A1K3TkjU94osaOI2fbMPyv/gVDiR83E+XtBSkwpz5+5dK2AG0RNh7JBYwHqZWEP4u9s7wwwSHGZX0v/w65xUBWZA8nfJLdMD4CZY42gPHLdd5QyfMruhTAHPwMq78DD5tNkVvZKOCT3OlLdlUnOKq1VMxiRLa18sdD03PSIameqK/WR5sg5zH75vkey48xgrrD1FUOb4kc15Qpo8pHBggD+2OsyeRav4aAXviFkj/yrZXEgJ+HPk+Zc5M4Pg2l9jLm+NRUT1VSklq25o8xQQGbUXu4BWI1glwvZO5HlNnunKGFHOKs59GACySgu9w3G2riJKMILvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B70gKRy7javyiS02uROv/RyLGEqbq/siw3rZJOLViU=;
 b=AwHK7/UYginbUL4x0txuclKvMvMXqXNBOiWVhyld45VUVpTAWw8ehyy393Os+LZeZXsFQvDqViCrk0zSsOZn3sXZN53QiqRSpp3YdIqkUmQTXOYlFK9EA/9OJa3i6wJKs2tYkzwX9ZD78vVcoE/JhwVweBYn+6FBQdfduurepDjAXSzXOIwesUrwhRxXZZSqkJBrbM8TBkJMbn28bvoPe9No5hsy1g/6oMfUz1iyoY+WKc/6bxf8ZWYKmBVFkOLKh01IRjX7Cxl4NRata8j4+DcmWmFZI+a6+XhzrcySZohpW7IgxNpBbY72uLs80Av/RRqJ/bss0Xwwm8fU9XIySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B70gKRy7javyiS02uROv/RyLGEqbq/siw3rZJOLViU=;
 b=Xa+dATVHv9YhBVcztkih9Pf0+hZmBnP4hDtTwdryQP/7tnvQKjMpl0cy91VyPoIp/VIBvNYn9SbE+EYoM2ij0RpdC5vAG20EprqhN7nrLnmREwFHsOJmYk7vKT41hAM2Pwm+bIuIdDIrpnrS+Nj0dsqyEQYsW1uydOjCdGdjp9Y=
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB2959.namprd12.prod.outlook.com (20.179.81.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 15:59:27 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 15:59:27 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AIAAB7mAgAANHgA=
Date: Fri, 1 Nov 2019 15:59:26 +0000
Message-ID: <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
In-Reply-To: <20191101151222.GN22766@mellanox.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c66652d-a310-4869-6dcc-08d75ee4789e
x-ms-traffictypediagnostic: MN2PR12MB2959:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2959AEFA4AFCD810CAD6FAF2E6620@MN2PR12MB2959.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(36756003)(256004)(14444005)(5024004)(5660300002)(186003)(476003)(102836004)(14454004)(386003)(2616005)(6436002)(478600001)(52116002)(66476007)(66946007)(64756008)(66556008)(66446008)(6486002)(7736002)(6116002)(305945005)(76176011)(486006)(6506007)(6246003)(26005)(99286004)(66066001)(3846002)(71200400001)(25786009)(8676002)(71190400001)(6916009)(4001150100001)(316002)(81166006)(81156014)(31686004)(8936002)(229853002)(7416002)(86362001)(53546011)(6512007)(11346002)(446003)(2906002)(4326008)(54906003)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2959;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Fd+ZIRFlYHudINQjv2FvowZfkrp/UC4KJ/g1mKxUpCr2aaHHg47rITqylM7RQ8PxGEG8AIl6rus7MGBRS2ZAP+XIQMsH4r7bCbQnifg0Ud8+QJbz5yp/F6a+LveWqATX1PIMrgBw5toqCvauirfcnzFC0id9f6m9VCd/UdYe0g0X2RggKlWMkRgROMYBL7vmZ/00bAbwXFzXh/NAXWIah5G9pGDnKB77lL3/nU1NQF79qejd5Gtuhalz5ReJyAPg919z13BitZ8MHkMixIrXjKbjSrfs/0WWmgltXVPYhhiUVF2sM4zwLw0Iyz+RkYR+1iixjW4+I85KKwe8rUtxq+2Q+dbvHEYk30efUgG7Yqq5fyVx/kzRYoygt5Az6+BPTpTlFPwfu4l7nxcnZ1D6g0pwMBI+SGROmGVst5to4Z7xn8vclH5OFK1g1zoFO2u
Content-ID: <2B29A7595DFC8C4E904872A54BF79A49@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c66652d-a310-4869-6dcc-08d75ee4789e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 15:59:26.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRcD5rCkg9YRWPD2cG2lq3anT/Bpz7B7kUKNijCPZ8WgFl7AmV8bKnq9OD3C7uBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2959
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



On 2019-11-01 11:12 a.m., Jason Gunthorpe wrote:
> On Fri, Nov 01, 2019 at 02:44:51PM +0000, Yang, Philip wrote:
>>
>>
>> On 2019-10-29 3:25 p.m., Jason Gunthorpe wrote:
>>> On Tue, Oct 29, 2019 at 07:22:37PM +0000, Yang, Philip wrote:
>>>> Hi Jason,
>>>>
>>>> I did quick test after merging amd-staging-drm-next with the
>>>> mmu_notifier branch, which includes this set changes. The test result
>>>> has different failures, app stuck intermittently, GUI no display etc. I
>>>> am understanding the changes and will try to figure out the cause.
>>>
>>> Thanks! I'm not surprised by this given how difficult this patch was
>>> to make. Let me know if I can assist in any way
>>>
>>> Please ensure to run with lockdep enabled.. Your symptops sounds sort
>>> of like deadlocking?
>>>
>> Hi Jason,
>>
>> Attached patch fix several issues in amdgpu driver, maybe you can squash
>> this into patch 14. With this is done, patch 12, 13, 14 is Reviewed-by
>> and Tested-by Philip Yang <philip.yang@amd.com>
> 
> Wow, this is great thanks! Can you clarify what the problems you found
> were? Was the bug the 'return !r' below?
> 
Yes. return !r is critical one, and retry if hmm_range_fault return 
-EBUSY is needed too.

> I'll also add your signed off by
> 
> Here are some remarks:
> 
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
>> index cb718a064eb4..c8bbd06f1009 100644
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
>> @@ -67,21 +67,15 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_range_notifier *mrn,
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>   	long r;
>>   
>> -	/*
>> -	 * FIXME: Must hold some lock shared with
>> -	 * amdgpu_ttm_tt_get_user_pages_done()
>> -	 */
>> -	mmu_range_set_seq(mrn, cur_seq);
>> +	mutex_lock(&adev->notifier_lock);
>>   
>> -	/* FIXME: Is this necessary? */
>> -	if (!amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm, range->start,
>> -					  range->end))
>> -		return true;
>> +	mmu_range_set_seq(mrn, cur_seq);
>>   
>> -	if (!mmu_notifier_range_blockable(range))
>> +	if (!mmu_notifier_range_blockable(range)) {
>> +		mutex_unlock(&adev->notifier_lock);
>>   		return false;
> 
> This test for range_blockable should be before mutex_lock, I can move
> it up
> 
yes, thanks.
> Also, do you know if notifier_lock is held while calling
> amdgpu_ttm_tt_get_user_pages_done()? Can we add a 'lock assert held'
> to amdgpu_ttm_tt_get_user_pages_done()?
> 
gpu side hold notifier_lock but kfd side doesn't. kfd side doesn't check 
amdgpu_ttm_tt_get_user_pages_done/mmu_range_read_retry return value but 
check mem->invalid flag which is updated from invalidate callback. It 
takes more time to change, I will come to another patch to fix it later.

>> @@ -854,12 +853,20 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
>>   		r = -EPERM;
>>   		goto out_unlock;
>>   	}
>> +	up_read(&mm->mmap_sem);
>> +	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> +
>> +retry:
>> +	range->notifier_seq = mmu_range_read_begin(&bo->notifier);
>>   
>> +	down_read(&mm->mmap_sem);
>>   	r = hmm_range_fault(range, 0);
>>   	up_read(&mm->mmap_sem);
>> -
>> -	if (unlikely(r < 0))
>> +	if (unlikely(r <= 0)) {
>> +		if ((r == 0 || r == -EBUSY) && !time_after(jiffies, timeout))
>> +			goto retry;
>>   		goto out_free_pfns;
>> +	}
> 
> This isn't really right, a retry loop like this needs to go all the
> way to mmu_range_read_retry() and done under the notifier_lock. ie
> mmu_range_read_retry() can fail just as likely as hmm_range_fault()
> can, and drivers are supposed to retry in both cases, with a single
> timeout.
> 
For gpu, check mmu_range_read_retry return value under the notifier_lock 
to do retry is in seperate location, not in same retry loop.

> AFAICT it is a major bug that many places ignore the return code of
> amdgpu_ttm_tt_get_user_pages_done() ???
>
For kfd, explained above.

> However, this is all pre-existing bugs, so I'm OK go ahead with this
> patch as modified. I advise AMD to make a followup patch ..
> 
yes, I will.
> I'll add a FIXME note to this effect.
> 
>>   	for (i = 0; i < ttm->num_pages; i++) {
>>   		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
>> @@ -916,7 +923,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
>>   		gtt->range = NULL;
>>   	}
>>   
>> -	return r;
>> +	return !r;
> 
> Ah is this the major error? hmm_range_valid() is inverted vs
> mmu_range_read_retry()?
> 
yes.
>>   }
>>   #endif
>>   
>> @@ -997,10 +1004,18 @@ static void amdgpu_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
>>   	sg_free_table(ttm->sg);
>>   
>>   #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
>> -	if (gtt->range &&
>> -	    ttm->pages[0] == hmm_device_entry_to_page(gtt->range,
>> -						      gtt->range->pfns[0]))
>> -		WARN_ONCE(1, "Missing get_user_page_done\n");
>> +	if (gtt->range) {
>> +		unsigned long i;
>> +
>> +		for (i = 0; i < ttm->num_pages; i++) {
>> +			if (ttm->pages[i] !=
>> +				hmm_device_entry_to_page(gtt->range,
>> +					      gtt->range->pfns[i]))
>> +				break;
>> +		}
>> +
>> +		WARN((i == ttm->num_pages), "Missing get_user_page_done\n");
>> +	}
> 
> Is this related/necessary? I can put it in another patch if it is just
> debugging improvement? Please advise
> 
I see this WARN backtrace now, but I didn't see it before. This is 
somehow related.

> Thanks a lot,
> Jason
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
