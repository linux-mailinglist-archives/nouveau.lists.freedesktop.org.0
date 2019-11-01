Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E090712B2E7
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B651B6E116;
	Fri, 27 Dec 2019 08:14:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B806E2EF;
 Fri,  1 Nov 2019 19:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfjvCecqyNYTSrGOR7r+WU9X1bqUQ5sETr1BgzOXUP323A118cNjNXHuKyR/ZDQVzM/6RMVtFoC8p9BKyCk86mfrdlCz2aroibuImRTUWWE9bd59aAQKhfNYqOntO1Xo+1JETFfejHIb240OrqIPZISTt9vNP17gsgSeU4c4ZFDr4nmJryVkDH19IciW3USzqorAd7bQcCDs9UQ2emsajaaOfOfiFA/uOiBi0Y5W0TZ1B0cxzsfH+Kb8ZDlf7YiKAPpWcupj+bz53+m/FUWgb3CowpdtlC3+CLf9LRA0Sht+UPb2xrQt07lQPpJCUyBcgnmgV6Ue2aoV+3vtvYzcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQALmFaHQBj9ABueXcOPRpdPf8j9bN5xAcp8z2adgQA=;
 b=QPOpIaPRpf7jVoDzZzT91QH7MJovKJmeTwDVWUUzXW5fL0VysXawA9SHVGev7FHTMMSR1UjKaxufYsYAcQYZVcVr8iEmGdGQhW9OX7FDoDHvKbMJCFeDfzQqmbG5p0mA7phK73fFDfpyZVpoYg/fnJGUHfw+b1D5dcN7L/Xk+ZINNX4mTz2/NPQFiTFBejJHDOtSVuayju1Wm1lMjETOZQJwbkoSc+FJKa3mHNxfzeiPfxGst5lkV+a1yrvyyZtA6kMiGAr0/zRIzV5NvqCxkgCx4a4/i8VLEZUJmwJuZDtxlUNy5kSQcChEu5tclZauxNic+LIWj3OJ7GkMWiOv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQALmFaHQBj9ABueXcOPRpdPf8j9bN5xAcp8z2adgQA=;
 b=lM65ZTXeNm7GCJ4Qe1uPxePQOjMK/iHVUJdSAZOlMLb4EAvnSDpeZew/xnzbVbpt3ki5egwr4cOkFNoUB0gAsRXjDlB0MQK+XBACxV53WEOwAM8Vbq9UgqVYufMaGoyTD/i7fLe9RZXu5lCsa+NM+PSpMWZNj2H0YIienLHAhpg=
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 1 Nov 2019 19:50:16 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 19:50:15 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AIAAB7mAgAANHgCAABzRAIAAIk6AgAABX4A=
Date: Fri, 1 Nov 2019 19:50:15 +0000
Message-ID: <186c8fae-9f3c-cc07-4790-9cc316a3179f@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
 <20191101174221.GO22766@mellanox.com>
 <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
In-Reply-To: <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 48f31fd1-f2b5-4088-fb9d-08d75f04b73d
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB342127E6889A0B09A5DF3A47E6620@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(199004)(189003)(102836004)(186003)(446003)(6916009)(66446008)(31696002)(5660300002)(6506007)(36756003)(6436002)(6246003)(26005)(229853002)(7416002)(305945005)(81166006)(7736002)(99286004)(476003)(6486002)(53546011)(6116002)(66066001)(81156014)(8676002)(8936002)(14454004)(486006)(3846002)(966005)(386003)(71190400001)(71200400001)(54906003)(64756008)(66476007)(31686004)(66556008)(256004)(14444005)(76176011)(2616005)(478600001)(52116002)(11346002)(86362001)(316002)(4326008)(25786009)(66946007)(6512007)(2906002)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cR/vteXymTTmw/7wb0pGhm1haHCOZeRPKAI/n/r1zHjgkx9HTbOVQs3HTNYY6BiILYoYC1+cMkJ7RRqE3UO15VkVwU8FC8bRVNN8DjpOtdl/1Bv0zwEB0m+wjeEM0pKm7GuNAy+0/mwFM7JXyTK2Q1ynTOw56bj20hCMfERs/FnW0UI1FJJfciIAPL63AGk5QhWcqCYIN2FA+Fy1nwsvwrsk0EdYW7et7noJ/W/hDyP04hMdUuxeY2ZMdwad8tGySVoCBknUwKfV1bcBKdetaxkcpS05ZODQ+/diptmbEV686DaDsUldRgoznMsU/Ra2XPn3y9G7BmHAFmUbT5agFFNaH7Vo5YwSwAlukLOaPhQg+yHIUXTjVJvo4VFDGWaRKQmsu+mT/VRK4vjh5L/zJAx9bSGRsFtK9uUtAOudmlLOHiZkxuZDs9CPVNhUqFMCw+CLtcjInc0OL3QMYYLjUvOpqXd4B4bimLtfMi3NW6w=
Content-ID: <DF30FFCD4D45424EB71F97A4EB49559A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f31fd1-f2b5-4088-fb9d-08d75f04b73d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:50:15.7813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9coEdTasHRdBaU1stJgvZQFP8uHoSq3mxTemofYyuL8xZMYJY5CnJsqWD+IoxKiy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Sorry, resend patch, the one in previous email missed couple of lines 
duo to copy/paste.

On 2019-11-01 3:45 p.m., Yang, Philip wrote:
> 
> 
> On 2019-11-01 1:42 p.m., Jason Gunthorpe wrote:
>> On Fri, Nov 01, 2019 at 03:59:26PM +0000, Yang, Philip wrote:
>>>> This test for range_blockable should be before mutex_lock, I can move
>>>> it up
>>>>
>>> yes, thanks.
>>
>> Okay, I wrote it like this:
>>
>> 	if (mmu_notifier_range_blockable(range))
>> 		mutex_lock(&adev->notifier_lock);
>> 	else if (!mutex_trylock(&adev->notifier_lock))
>> 		return false;
>>
>>>> Also, do you know if notifier_lock is held while calling
>>>> amdgpu_ttm_tt_get_user_pages_done()? Can we add a 'lock assert held'
>>>> to amdgpu_ttm_tt_get_user_pages_done()?
>>>
>>> gpu side hold notifier_lock but kfd side doesn't. kfd side doesn't check
>>> amdgpu_ttm_tt_get_user_pages_done/mmu_range_read_retry return value but
>>> check mem->invalid flag which is updated from invalidate callback. It
>>> takes more time to change, I will come to another patch to fix it later.
>>
>> Ah.. confusing, OK, I'll let you sort that
>>
>>>> However, this is all pre-existing bugs, so I'm OK go ahead with this
>>>> patch as modified. I advise AMD to make a followup patch ..
>>>>
>>> yes, I will.
>>
>> While you are here, this is also wrong:
>>
>> int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
>> {
>> 	down_read(&mm->mmap_sem);
>> 	r = hmm_range_fault(range, 0);
>> 	up_read(&mm->mmap_sem);
>> 	if (unlikely(r <= 0)) {
>> 		if ((r == 0 || r == -EBUSY) && !time_after(jiffies, timeout))
>> 			goto retry;
>> 		goto out_free_pfns;
>> 	}
>>
>> 	for (i = 0; i < ttm->num_pages; i++) {
>> 		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
>>
>> It is not allowed to read the results of hmm_range_fault() outside
>> locking, and in particular, we can't convert to a struct page.
>>
>> This must be done inside the notifier_lock, after checking
>> mmu_range_read_retry(), all handling of the struct page must be
>> structured like that.
>>
> Below change will fix this, then driver will call mmu_range_read_retry
> second time using same range->notifier_seq to check if range is
> invalidated inside amdgpu_cs_submit, this looks ok for me.
> 
@@ -797,6 +797,7 @@ static const uint64_t 
hmm_range_values[HMM_PFN_VALUE_MAX] = {
   */
  int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page 
**pages)
  {
+       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
         struct ttm_tt *ttm = bo->tbo.ttm;
         struct amdgpu_ttm_tt *gtt = (void *)ttm;
         unsigned long start = gtt->userptr;
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

> 
> Philip
> 
>>>>> @@ -997,10 +1004,18 @@ static void amdgpu_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
>>>>>     	sg_free_table(ttm->sg);
>>>>>     
>>>>>     #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
>>>>> -	if (gtt->range &&
>>>>> -	    ttm->pages[0] == hmm_device_entry_to_page(gtt->range,
>>>>> -						      gtt->range->pfns[0]))
>>>>> -		WARN_ONCE(1, "Missing get_user_page_done\n");
>>>>> +	if (gtt->range) {
>>>>> +		unsigned long i;
>>>>> +
>>>>> +		for (i = 0; i < ttm->num_pages; i++) {
>>>>> +			if (ttm->pages[i] !=
>>>>> +				hmm_device_entry_to_page(gtt->range,
>>>>> +					      gtt->range->pfns[i]))
>>>>> +				break;
>>>>> +		}
>>>>> +
>>>>> +		WARN((i == ttm->num_pages), "Missing get_user_page_done\n");
>>>>> +	}
>>>>
>>>> Is this related/necessary? I can put it in another patch if it is just
>>>> debugging improvement? Please advise
>>>>
>>> I see this WARN backtrace now, but I didn't see it before. This is
>>> somehow related.
>>
>> Hm, might be instructive to learn what is going on..
>>
>> Thanks,
>> Jason
>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
