Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1757ADE1A
	for <lists+nouveau@lfdr.de>; Mon, 25 Sep 2023 19:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB03110E2C3;
	Mon, 25 Sep 2023 17:55:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DC010E2C0;
 Mon, 25 Sep 2023 17:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+TNURRwsM+eYovVSQ+dm3Tfh5BCkuIRlxNKp2NrHQ24PGGOOzSqemzNWHFchD8ltdIVL9Q0BVxrC/5sEQ7KmkEPe9XOZjWr/dgCh2lX8XxcrDQZb9MjK3GNeTT4vp7yoIlmyFaFrbwcNiWxdrTazeaRNFCrExNYLr/yxCOTfjB5KSVXgGq6A9wS5WL3vmrNSTTuh/9hiXOSSfF+2UTF+Cgi16Vt8vHaPj2/89ZoG60gEgyYZIpOwmMflbZKMJhP8cl+bvNbcwWEQI0YGQSpFAjmtjOyK52rdOosqTshmE4Ni3EGu0vsh4Lo1abVwrJSEwNI4F36Z50zQzIeMTUeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2uXVVXLnfgUoEW/Klq7Vsnb+r9id0aZXC0Ne5WFvZA=;
 b=KJer2c86J+mkm3iMZdtY454a3CMIO4TD5i77q3+zUgwb/CR5o4tXbPpUJGv352Ub2FzAjYY4XdPiy8JpDPiwksGEZLB4RxiDwQGIZM/4IPNWbU/a0Fzu9JnpaCqNpKdqOb+fgojDlJqtjMv6Ij7Wj3xy2NAeVA3iSIEyzc/y6U/woymoKKz67sBMo76OuZrmZLjowTHMFN3Q5i+V0dVadB+PttmpjNtZxfXYOq/vyoGYkN9o5N+IYiVqmeP6++yeKEjaNTWxN2pCegnavzgJgH2q/sAGe/15xAtoO0XyphOIGWOiIVbf7t3bsLWc/LObQFO5Urzp1vdyjnd8LCstOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2uXVVXLnfgUoEW/Klq7Vsnb+r9id0aZXC0Ne5WFvZA=;
 b=NbzCZJgKlw/d2FVBiTyoBG+RwsHfExcVY2uhD01sGwWTi6VhicBoevdJCT9W+jdPTWnLZiNVx7VEsmHVs82aXJGIfbRtkwmYc8a0DgbBGCKAfWvqWo8Q/5lIbnxSHQR7vrCdXGb4BSykQxYkTqC839sJ02glJdGDFaGYhsluCyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 17:55:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 17:55:28 +0000
Message-ID: <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
Date: Mon, 25 Sep 2023 19:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230925145513.49abcc52@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 2432b181-7404-4b69-361c-08dbbdf09a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oAtyALqf2YdBww2C9xhfg119+gWl2jaqYAnmp6D7SeajfM0byZOen9iHYriUdCWWm/5jr4hcPwzg6F8OIkF8IbiZjQRVlJ9H4sdCvTfOOn+pd7ovL3ft/K1kY0HM3MIlLpkdEaJYEvpnXpxPMkZdIQ2/Q+Q3PQGT2hS9qNcbICv+E1dky7z5/C61tqqsERO0bSgb1vpc+Y7tc6HmW9awZ7BIYi8QSPpikcHn95XOLFXZjawjxg0RNo1bsq48eNiorwhaKsWiU+SFXkwJkUrPdpFsj+IdqFMWhwsmix7LnlORyklsYr/uNVEYB/FsltkUi6oMT/df/pRMPnNMSq3gVplmCOcM6dPRuw74uaX7h54Zz9OCcx0NBwo/h9VdKNTsPeYRTBq399VnpEdkJQB2Gd8xUTVymsvUR/PPljD67BvFwDWzUWGS/OXGh1QoQ7ngHsD2O7Qi72PmJ/6xDP75NqVMrS/koCFIy/An0ll5kfx9XqLN4Lw8H7JKQTs1b9tYxR213VXu0resQ00A3qbaZMDF35GXZEBcoorJOEXC3SXfeuvY/dkVdipJGNdAlG04paCXgXtnnrJ5CBqFmk0aObQdaJ4OiC6NuXNjB2eUmWVbordC2LaVCBOkk0S50RZ0xs+ySJ8QcsGDrKzazk2aTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(86362001)(2616005)(41300700001)(26005)(6506007)(6486002)(6512007)(36756003)(38100700002)(31696002)(316002)(83380400001)(8936002)(8676002)(4326008)(54906003)(66556008)(66476007)(110136005)(5660300002)(66946007)(2906002)(30864003)(31686004)(7416002)(478600001)(6666004)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFjbytnZ2RxOFdoM1dCNE95QXNTQ1VJbnc5b3hSN25heS9zbmdOY0NhcS9D?=
 =?utf-8?B?TjJQT0xHTW52Z3QwVkpnb3poQlN0dG1YTDBCaEc1OGtEYmpaUmkrZDBjYmg5?=
 =?utf-8?B?WkJPdENQWUIxamN3YlVxblZoQzN5Y054d2RLeHRTSmxqTTZ5bVBXa2VpbHJQ?=
 =?utf-8?B?eTVnZUkyd3YzQ0NoTjZ2Q3JpOGsvOFVYdnRYczV2a0xSWUhRK256S3hsRmpq?=
 =?utf-8?B?ZTByMlNZNGpBUnNvVVoxNi8wZXJyTko2V2hhZ0pHNTZwaVMyTHk4bjJQZVFZ?=
 =?utf-8?B?OVJ5WERyVmJ4SFZKZ2FtcjRMd3NhSU1BYmcyT0dsc3VtVEIvZXVlS0ErY21v?=
 =?utf-8?B?T2ZjdnJkbndQQXdSN2V5T3kreXYwVTJBejIwdERsTzNHUEI4M3ViMFNlcE5w?=
 =?utf-8?B?TlhUREw5QWlCRnJRUHZUM043VWhLelNBWFNya3ZhaTFrZnlvMDlRUk9jQ1FQ?=
 =?utf-8?B?Z2Z2dVRkVWV4OElxb3ptSnJBTUF4cXdQUEVGeG5KWDE4eWNXU204L25Yc09T?=
 =?utf-8?B?UjJUK1VZNDZUajcvWmg2REFHMmlwYnFRNFppQXlMTGtPbWoyZnVUYTN4SVJT?=
 =?utf-8?B?bmJIcGFjS3hoSU5NVTE5K0xDNjRtQlVyR28vMUpWQmRPa1JwQ0h5SkRFcUsz?=
 =?utf-8?B?SGw3RlFxbWJWeUZjT20xaFlQMlZ1QTFwbW5NN0NRdDFlZUJqYy9sdHdqN1Mv?=
 =?utf-8?B?cU9GMHBKc0h2ZG45bW9GdGRTbms4U3NLQk0rK0NwaG9HejVTMGNsVitsSGNU?=
 =?utf-8?B?bXJRbU0yUUdBZDd1ckgxdERZcVBlOVNzSnFnUWdoZWZMMk9ISFRHYkhkdFpT?=
 =?utf-8?B?dktPVWZ1VE5ZbG1yLzMzUzZMelBHVFpMVEQ5STZhbmxVWThIQXN6RWpXcFFS?=
 =?utf-8?B?bUJ3dzZGRjNWckRrVTY0bGI4R0pKY1l5a0RSVDFMN3p4dUtnd1BDYVVrUUZW?=
 =?utf-8?B?SUNydTB0YmhFTHEzekFYMStQNXR3Z1lhV2o1Ym4wYkliZzYzTWVOSUxoMEZ4?=
 =?utf-8?B?M3lmU0dXMnpiWGRWRVlhbFpWNmtWV01TVWQzU09YaUg0RGlSbG9sRHF2WU1I?=
 =?utf-8?B?My94WWt5eG9JZGRwMUVqY3JTc1kvRVBKcmF5NWNDSWZIT2JtNE9kRlhrNExV?=
 =?utf-8?B?cGZ2Y0hvVkE5TlNjdUFFSUtseWx0TUVabnh6TkxRbUhEVjM0bFJsMUxJZmVs?=
 =?utf-8?B?ZHQ1blNwRHBSWmVGTzIveTRYQVRVOXVtSkloQ0xrbFJybC8yazBtMk03WFQ0?=
 =?utf-8?B?c3BIVWUzM2dyS2Rvc2ZRS0xNLzhOU1RoWktpR252blVYQzNGYXdPREVLMHpK?=
 =?utf-8?B?NGZCNEk3cmw1dTFkWk93eGdQOWxSYW1NN2padE9CTWFIdDRvRFdjY0NHR3Qw?=
 =?utf-8?B?bDVyVDdBaGNXVjRjMVNJVFY4amx1SkZUTW9welpuNm1uRkhPekFaaEVRblJ1?=
 =?utf-8?B?K0FvRlZqaVNkRVZXejd5YUcxUXJBd2xvUytHQStKb2tob0NjOWEzZlRmdG9p?=
 =?utf-8?B?YjUwbzZORDJGTCtDcEgyZEp4eFVzT1NRS1MxSVVRcW50eG1yOEx5dE1tcTc1?=
 =?utf-8?B?S3pWZnFNQWd0QndwTlJoRmJHcGNTODJjeXZaZ09ESjE0OStMY0FCVmYrQWRy?=
 =?utf-8?B?OGFhZlVvZXI2YWl1TUU3eFNtWGZCMnFJUzhhQlZZdzMvTGY2R3dOaEp4NmEw?=
 =?utf-8?B?MnpaL0ZKd1dMVzlGVFNtNWRYNk1TMmUwRzQ5SU15b2dkMlZILzVFd1M3SlpI?=
 =?utf-8?B?UDQxblc1bjlnRVlPb1hWd0MvaEtSUEJYcEljbDlZWkJXQlZ5L2V4cHMwYWRD?=
 =?utf-8?B?MHZZRDRFTnhLV3AzdkdXamVLeDlzWjNkeGd3ZWxlYTBXVDlJRzJEYzQxN3J4?=
 =?utf-8?B?NkUwSkdYQ1hiQ1lIL2tvWHRxd3NhU3YyZlZKRTlkN05BUHl4VFpjMmdZbHhJ?=
 =?utf-8?B?NE5sRGlxTTA0RWtZbUNSMUM4OStURFArQ2hRTXR4dEQ0SzdaaE8zNnBEMFJP?=
 =?utf-8?B?aHNNRnNld2h3NUVhTHRkemxxMm5JOXh3ZEtCNmpFRWRrZzJ5TVNteUk4Y1pM?=
 =?utf-8?B?YjJLOHU1cUo2NnpMamNjNERmV2VoRWlSOERHN0ZLYUZvRTFtSGZtNUVrdVVo?=
 =?utf-8?Q?Xrhk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2432b181-7404-4b69-361c-08dbbdf09a22
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 17:55:28.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6foXGYAZWz9awNg8jMFpXMxPJa1fIljYuvDzkuHZySjei3qxV4Pm7bhD8cgTetAE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387
Subject: Re: [Nouveau] [PATCH drm-misc-next 1/3] drm/sched: implement
 dynamic job flow control
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, Frank Binns <Frank.Binns@imgtec.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, Donald Robson <Donald.Robson@imgtec.com>,
 daniel@ffwll.ch, faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



Am 25.09.23 um 14:55 schrieb Boris Brezillon:
> +The imagination team, who's probably interested too.
>
> On Mon, 25 Sep 2023 00:43:06 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
>
>> Currently, job flow control is implemented simply by limiting the amount
>> of jobs in flight. Therefore, a scheduler is initialized with a
>> submission limit that corresponds to a certain amount of jobs.
>>
>> This implies that for each job drivers need to account for the maximum
>> job size possible in order to not overflow the ring buffer.
>>
>> However, there are drivers, such as Nouveau, where the job size has a
>> rather large range. For such drivers it can easily happen that job
>> submissions not even filling the ring by 1% can block subsequent
>> submissions, which, in the worst case, can lead to the ring run dry.
>>
>> In order to overcome this issue, allow for tracking the actual job size
>> instead of the amount job jobs. Therefore, add a field to track a job's
>> submission units, which represents the amount of units a job contributes
>> to the scheduler's submission limit.
> As mentioned earlier, this might allow some simplifications in the
> PowerVR driver where we do flow-control using a dma_fence returned
> through ->prepare_job(). The only thing that'd be missing is a way to
> dynamically query the size of a job (a new hook?), instead of having the
> size fixed at creation time, because PVR jobs embed native fence waits,
> and the number of native fences will decrease if some of these fences
> are signalled before ->run_job() is called, thus reducing the job size.

Exactly that is a little bit questionable since it allows for the device 
to postpone jobs infinitely.

It would be good if the scheduler is able to validate if it's ever able 
to run the job when it is pushed into the entity.

Otherwise you can end up with really hard to debug problems.

Regards,
Christian.

>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>> This patch is based on Matt's scheduler work [1].
>>
>> [1] https://lore.kernel.org/dri-devel/20230919050155.2647172-1-matthew.brost@intel.com/
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  2 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  2 +-
>>   drivers/gpu/drm/lima/lima_sched.c             |  2 +-
>>   drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_sched.c       |  2 +-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   |  2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c      |  5 +-
>>   drivers/gpu/drm/scheduler/sched_main.c        | 81 +++++++++++++------
>>   drivers/gpu/drm/v3d/v3d_gem.c                 |  2 +-
>>   include/drm/gpu_scheduler.h                   | 18 +++--
>>   11 files changed, 78 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 78476bc75b4e..d54daaf64bf1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   	if (!entity)
>>   		return 0;
>>   
>> -	return drm_sched_job_init(&(*job)->base, entity, owner);
>> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>>   }
>>   
>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> index 45403ea38906..74a446711207 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> @@ -538,7 +538,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>   
>>   	ret = drm_sched_job_init(&submit->sched_job,
>>   				 &ctx->sched_entity[args->pipe],
>> -				 submit->ctx);
>> +				 1, submit->ctx);
>>   	if (ret)
>>   		goto err_submit_put;
>>   
>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>> index 50c2075228aa..5dc6678e1eb9 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>   	for (i = 0; i < num_bos; i++)
>>   		drm_gem_object_get(&bos[i]->base.base);
>>   
>> -	err = drm_sched_job_init(&task->base, &context->base, vm);
>> +	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
>>   	if (err) {
>>   		kfree(task->bos);
>>   		return err;
>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>> index 3f1aa4de3b87..6d230c38e4f5 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> -	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
>> +	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>>   	if (ret) {
>>   		kfree(submit->hw_fence);
>>   		kfree(submit);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> index f26a814a9920..e991426d86e4 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
>>   
>>   	}
>>   
>> -	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
>> +	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>>   	if (ret)
>>   		goto err_free_chains;
>>   
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index a2ab99698ca8..d5e777deee5c 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -272,7 +272,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>   
>>   	ret = drm_sched_job_init(&job->base,
>>   				 &file_priv->sched_entity[slot],
>> -				 NULL);
>> +				 1, NULL);
>>   	if (ret)
>>   		goto out_put_job;
>>   
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 3143ecaaff86..2e4ffdecc5dc 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			   __assign_str(name, sched_job->sched->name);
>>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>>   			   __entry->hw_job_count = atomic_read(
>> -				   &sched_job->sched->hw_rq_count);
>> +				   &sched_job->sched->submission_count);
>>   			   ),
>>   	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>>   		      __entry->entity, __entry->id,
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 437c50867c99..6395090d5784 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -401,7 +401,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>   		container_of(cb, struct drm_sched_entity, cb);
>>   
>>   	drm_sched_entity_clear_dep(f, cb);
>> -	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity),
>> +				      entity);
>>   }
>>   
>>   /**
>> @@ -645,7 +646,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   		if (fifo)
>>   			drm_sched_rq_update_fifo(entity, submit_ts);
>>   
>> -		drm_sched_wakeup_if_can_queue(sched);
>> +		drm_sched_wakeup_if_can_queue(sched, entity);
>>   	}
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_push_job);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 88ef8be2d3c7..857622dd842e 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -93,6 +93,9 @@ int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
>>   MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>   module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
>>   
>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>> +				struct drm_sched_entity *entity);
>> +
>>   static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>   							    const struct rb_node *b)
>>   {
>> @@ -212,13 +215,15 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   /**
>>    * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>    *
>> + * @sched: the gpu scheduler
>>    * @rq: scheduler run queue to check.
>>    * @dequeue: dequeue selected entity
>>    *
>>    * Try to find a ready entity, returns NULL if none found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>> +			      struct drm_sched_rq *rq, bool dequeue)
>>   {
>>   	struct drm_sched_entity *entity;
>>   
>> @@ -227,7 +232,8 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>   	entity = rq->current_entity;
>>   	if (entity) {
>>   		list_for_each_entry_continue(entity, &rq->entities, list) {
>> -			if (drm_sched_entity_is_ready(entity)) {
>> +			if (drm_sched_entity_is_ready(entity) &&
>> +			    drm_sched_can_queue(sched, entity)) {
>>   				if (dequeue) {
>>   					rq->current_entity = entity;
>>   					reinit_completion(&entity->entity_idle);
>> @@ -240,7 +246,8 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>   
>>   	list_for_each_entry(entity, &rq->entities, list) {
>>   
>> -		if (drm_sched_entity_is_ready(entity)) {
>> +		if (drm_sched_entity_is_ready(entity) &&
>> +		    drm_sched_can_queue(sched, entity)) {
>>   			if (dequeue) {
>>   				rq->current_entity = entity;
>>   				reinit_completion(&entity->entity_idle);
>> @@ -261,13 +268,15 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>   /**
>>    * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>    *
>> + * @sched: the gpu scheduler
>>    * @rq: scheduler run queue to check.
>>    * @dequeue: dequeue selected entity
>>    *
>>    * Find oldest waiting ready entity, returns NULL if none found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>> +				struct drm_sched_rq *rq, bool dequeue)
>>   {
>>   	struct rb_node *rb;
>>   
>> @@ -276,7 +285,8 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>   		struct drm_sched_entity *entity;
>>   
>>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>> -		if (drm_sched_entity_is_ready(entity)) {
>> +		if (drm_sched_entity_is_ready(entity) &&
>> +		    drm_sched_can_queue(sched, entity)) {
>>   			if (dequeue) {
>>   				rq->current_entity = entity;
>>   				reinit_completion(&entity->entity_idle);
>> @@ -300,15 +310,27 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>   }
>>   
>>   /**
>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>> + * drm_sched_can_queue - can we queue more jobs?
>>    * @sched: scheduler instance
>> + * @entity: the scheduler entity
>>    *
>> - * Return true if we can push more jobs to the hw, otherwise false.
>> + * Return true if we can push at least one more job from @entity, false
>> + * otherwise.
>>    */
>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>> +				struct drm_sched_entity *entity)
>>   {
>> -	return atomic_read(&sched->hw_rq_count) <
>> -		sched->hw_submission_limit;
>> +	struct drm_sched_job *s_job;
>> +
>> +	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> +	if (!s_job)
>> +		return false;
>> +
>> +	WARN_ON(s_job->submission_units > sched->submission_limit);
>> +
>> +	return (sched->submission_limit -
>> +		atomic_read(&sched->submission_count)) >=
>> +		s_job->submission_units;
>>   }
>>   
>>   /**
>> @@ -325,12 +347,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>   	struct drm_sched_entity *entity;
>>   	int i;
>>   
>> -	if (!drm_sched_can_queue(sched))
>> -		return NULL;
>> -
>>   	if (sched->single_entity) {
>>   		if (!READ_ONCE(sched->single_entity->stopped) &&
>> -		    drm_sched_entity_is_ready(sched->single_entity))
>> +		    drm_sched_entity_is_ready(sched->single_entity) &&
>> +		    drm_sched_can_queue(sched, sched->single_entity))
>>   			return sched->single_entity;
>>   
>>   		return NULL;
>> @@ -339,9 +359,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>   	/* Kernel run queue has higher priority than normal run queue*/
>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>> +			drm_sched_rq_select_entity_fifo(sched,
>> +							&sched->sched_rq[i],
>>   							dequeue) :
>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>> +			drm_sched_rq_select_entity_rr(sched,
>> +						      &sched->sched_rq[i],
>>   						      dequeue);
>>   		if (entity)
>>   			break;
>> @@ -399,7 +421,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>   	struct drm_sched_fence *s_fence = s_job->s_fence;
>>   	struct drm_gpu_scheduler *sched = s_fence->sched;
>>   
>> -	atomic_dec(&sched->hw_rq_count);
>> +	atomic_sub(s_job->submission_units, &sched->submission_count);
>>   	atomic_dec(sched->score);
>>   
>>   	trace_drm_sched_process_job(s_fence);
>> @@ -622,7 +644,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>   					      &s_job->cb)) {
>>   			dma_fence_put(s_job->s_fence->parent);
>>   			s_job->s_fence->parent = NULL;
>> -			atomic_dec(&sched->hw_rq_count);
>> +			atomic_sub(s_job->submission_units,
>> +				   &sched->submission_count);
>>   		} else {
>>   			/*
>>   			 * remove job from pending_list.
>> @@ -683,7 +706,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>   	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>   		struct dma_fence *fence = s_job->s_fence->parent;
>>   
>> -		atomic_inc(&sched->hw_rq_count);
>> +		atomic_add(s_job->submission_units, &sched->submission_count);
>>   
>>   		if (!full_recovery)
>>   			continue;
>> @@ -764,6 +787,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>    * drm_sched_job_init - init a scheduler job
>>    * @job: scheduler job to init
>>    * @entity: scheduler entity to use
>> + * @submission_units: the amount of units this job contributes to the schdulers
>> + * submission limit
>>    * @owner: job owner for debugging
>>    *
>>    * Refer to drm_sched_entity_push_job() documentation
>> @@ -781,6 +806,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>    */
>>   int drm_sched_job_init(struct drm_sched_job *job,
>>   		       struct drm_sched_entity *entity,
>> +		       u32 submission_units,
>>   		       void *owner)
>>   {
>>   	if (!entity->rq && !entity->single_sched)
>> @@ -792,6 +818,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>   		return -ENOMEM;
>>   
>>   	INIT_LIST_HEAD(&job->list);
>> +	job->submission_units = submission_units ? submission_units : 1;
>>   
>>   	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>>   
>> @@ -1004,12 +1031,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>>   /**
>>    * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>    * @sched: scheduler instance
>> + * @entity: the scheduler entity
>>    *
>>    * Wake up the scheduler if we can queue jobs.
>>    */
>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>> +				   struct drm_sched_entity *entity)
>>   {
>> -	if (drm_sched_can_queue(sched))
>> +	if (drm_sched_can_queue(sched, entity))
>>   		drm_sched_run_job_queue(sched);
>>   }
>>   
>> @@ -1147,7 +1176,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>   
>>   	s_fence = sched_job->s_fence;
>>   
>> -	atomic_inc(&sched->hw_rq_count);
>> +	atomic_add(sched_job->submission_units, &sched->submission_count);
>>   	drm_sched_job_begin(sched_job);
>>   
>>   	trace_drm_run_job(sched_job, entity);
>> @@ -1183,7 +1212,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>    * @ops: backend operations for this scheduler
>>    * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>>    *	       allocated and used
>> - * @hw_submission: number of hw submissions that can be in flight
>> + * @max_submission_units: number of submission units that can be in flight
>>    * @hang_limit: number of times to allow a job to hang before dropping it
>>    * @timeout: timeout value in jiffies for the scheduler
>>    * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
>> @@ -1198,7 +1227,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   		   const struct drm_sched_backend_ops *ops,
>>   		   struct workqueue_struct *submit_wq,
>> -		   unsigned hw_submission, unsigned hang_limit,
>> +		   unsigned max_submission_units, unsigned hang_limit,
>>   		   long timeout, struct workqueue_struct *timeout_wq,
>>   		   atomic_t *score, const char *name,
>>   		   enum drm_sched_policy sched_policy,
>> @@ -1211,7 +1240,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   
>>   	sched->ops = ops;
>>   	sched->single_entity = NULL;
>> -	sched->hw_submission_limit = hw_submission;
>> +	sched->submission_limit = max_submission_units;
>>   	sched->name = name;
>>   	if (!submit_wq) {
>>   		sched->submit_wq = alloc_ordered_workqueue(name, 0);
>> @@ -1238,7 +1267,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   	init_waitqueue_head(&sched->job_scheduled);
>>   	INIT_LIST_HEAD(&sched->pending_list);
>>   	spin_lock_init(&sched->job_list_lock);
>> -	atomic_set(&sched->hw_rq_count, 0);
>> +	atomic_set(&sched->submission_count, 0);
>>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>   	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>> index 2e94ce788c71..8479e5302f7b 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>>   	job->free = free;
>>   
>>   	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
>> -				 v3d_priv);
>> +				 1, v3d_priv);
>>   	if (ret)
>>   		goto fail;
>>   
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 27f5778bbd6d..89b0aecd02e3 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -329,6 +329,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>    * @sched: the scheduler instance on which this job is scheduled.
>>    * @s_fence: contains the fences for the scheduling of job.
>>    * @finish_cb: the callback for the finished fence.
>> + * @submission_units: the amount of submission units this job contributes to
>> + *                    the scheduler
>>    * @work: Helper to reschdeule job kill to different context.
>>    * @id: a unique id assigned to each job scheduled on the scheduler.
>>    * @karma: increment on every hang caused by this job. If this exceeds the hang
>> @@ -348,6 +350,8 @@ struct drm_sched_job {
>>   	struct drm_gpu_scheduler	*sched;
>>   	struct drm_sched_fence		*s_fence;
>>   
>> +	u32				submission_units;
>> +
>>   	/*
>>   	 * work is used only after finish_cb has been used and will not be
>>   	 * accessed anymore.
>> @@ -478,14 +482,14 @@ struct drm_sched_backend_ops {
>>    *
>>    * @ops: backend operations provided by the driver.
>>    * @single_entity: Single entity for the scheduler
>> - * @hw_submission_limit: the max size of the hardware queue.
>> + * @submission_limit: the maximim amount of submission units
>> + * @submission_count: the number current amount of submission units in flight
>>    * @timeout: the time after which a job is removed from the scheduler.
>>    * @name: name of the ring for which this scheduler is being used.
>>    * @sched_rq: priority wise array of run queues.
>>    * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>>    *                 waits on this wait queue until all the scheduled jobs are
>>    *                 finished.
>> - * @hw_rq_count: the number of jobs currently in the hardware queue.
>>    * @job_id_count: used to assign unique id to the each job.
>>    * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>    * @timeout_wq: workqueue used to queue @work_tdr
>> @@ -511,12 +515,12 @@ struct drm_sched_backend_ops {
>>   struct drm_gpu_scheduler {
>>   	const struct drm_sched_backend_ops	*ops;
>>   	struct drm_sched_entity		*single_entity;
>> -	uint32_t			hw_submission_limit;
>> +	u32				submission_limit;
>> +	atomic_t			submission_count;
>>   	long				timeout;
>>   	const char			*name;
>>   	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>   	wait_queue_head_t		job_scheduled;
>> -	atomic_t			hw_rq_count;
>>   	atomic64_t			job_id_count;
>>   	struct workqueue_struct		*submit_wq;
>>   	struct workqueue_struct		*timeout_wq;
>> @@ -539,7 +543,7 @@ struct drm_gpu_scheduler {
>>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   		   const struct drm_sched_backend_ops *ops,
>>   		   struct workqueue_struct *submit_wq,
>> -		   uint32_t hw_submission, unsigned hang_limit,
>> +		   uint32_t max_submission_units, unsigned hang_limit,
>>   		   long timeout, struct workqueue_struct *timeout_wq,
>>   		   atomic_t *score, const char *name,
>>   		   enum drm_sched_policy sched_policy,
>> @@ -548,6 +552,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>   int drm_sched_job_init(struct drm_sched_job *job,
>>   		       struct drm_sched_entity *entity,
>> +		       u32 submission_units,
>>   		       void *owner);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>> @@ -570,7 +575,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>   
>>   void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>> +				   struct drm_sched_entity *entity);
>>   bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
>>   void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
>>   void drm_sched_submit_start(struct drm_gpu_scheduler *sched);

