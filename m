Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5D2C5413
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 13:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2E06E895;
	Thu, 26 Nov 2020 12:41:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB806E895
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 12:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3Cq06aVii30meYdBd6lAI6oja2iBOGynUPtDqBtUznlLCVWuILiZgszGog49Qjnu8udOUxcG05cvwHQzyocVJrJ+ZOHZh4Sf33jFK/KSuFMmmIgaCCHpwTYAgWQjHZk0nxUikUk6f8+fljtdW7c2wluiLk+pyVJ9pSDCwnAADHdOBqdWBdl2TOulm16gU8x0QS3lEZhVZeqJH5pgPp6wF+arhyPj7oggr0Yr0BqXa3SNlNw9eGLG/ryjPVrEebwG7WeRtZE5gtUR/mOs+fkTVBLeuTwLmqZDh8OY5NnBO/i2c9Dih99W1mawqt/U05i7ZEhep+d7WhqxYpl6zmMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz6XBrVMaazlLY7kL3rajS+taohW7lO4WfGL89RFtQM=;
 b=MkZ4Qi+n7F8loV2AdLDF+B1uNgcpN0/rtJMAFDyeku2yMrm2OLgJQdbpbPLhlEpl0wor6Jfh1pCok9LCZOrN7IM6/aJL4AYTxukA6UX9mbIeLgg4vcE5Gj/qoeBNIfwo6EhKC0hvm0FY85O0O6xw+BtIkya9z44HnwXcU4Cj8UeRFv1h3pYViNETcvsSR3kEavOHrnqM13pIBzrCdjg1asaSV011ctlm/FUbJ/tjf4jo2v7ixGL0qx4IgBUGbk2fHi7+vKhAD10nq9kt1NOPgZfu6IbHYmMNy+0hr+MroVg0/SCqz+bzpv8O6Xm77il9nTVKgJ61ruu1O+tO8jLiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz6XBrVMaazlLY7kL3rajS+taohW7lO4WfGL89RFtQM=;
 b=g3o7u9YMjYlPM9sRWKvciV+eymtZK2PLyZmFhToVCdFB+rqyWcIFRBPXN2kysogZxrYEGiaVAkePgfDzJZEZpTha4oLHvClGU+U1dR3dcBPGoeDtGbaBlYvzNYnd1Un2ysVaTIk5OSqbj8t309w7wtbL0LRV55tvjXUNelRhMKc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4691.namprd12.prod.outlook.com (2603:10b6:208:84::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 12:41:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Thu, 26 Nov 2020
 12:41:07 +0000
To: dmarkh@cfl.rr.com, markh@compro.net, nouveau@lists.freedesktop.org
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
 <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
 <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
 <e84a7564-921c-d852-b62d-80563bea99b1@amd.com>
 <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557@cfl.rr.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <47ab20f6-dc56-8ade-29b6-f8fc684628d3@amd.com>
Date: Thu, 26 Nov 2020 13:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557@cfl.rr.com>
Content-Type: multipart/mixed; boundary="------------093077957EB13B9EC07936BD"
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.6 via Frontend Transport; Thu, 26 Nov 2020 12:41:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 138ca3ca-31ce-4403-bb71-08d892088bb8
X-MS-TrafficTypeDiagnostic: BL0PR12MB4691:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4691E28957988D87F76CD2D383F90@BL0PR12MB4691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18omEUGm/r3dRRK/scKfySZs3GwKTu7L3UbxC/QYj9aHLihXES7+GebPNeauiP3rp1PYpk7aWhIQW3nu4EWBH5y4/0YoFw4FUN3uvr31NSqVH6O8DTmykESbCd5Qg+SC7Hz6m5AYd9XwXYlqDooJQWt0wS/kNH/EI0p8FW/vyhGxUdPJQS+EQtXNW6G+bFq+7G0IBsiVA+9rgWSkIu+cGDDdcVgvO2ZhxE3r1hJMIpOXAqKU1Xs53aTreAjvS1flWwulG7YYO6Qqa9kI9q3AIp2UsacaugCQuRZAGv5HJPWIBgsNPIYidMDlYSV6a8XQkfq+LDnqLHeZMQpRoSnx9/DmoGVUSKFxlsULOy+OByYsQlIhkSrW04iKFRxpUgrE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(86362001)(8936002)(186003)(31686004)(53546011)(66476007)(52116002)(66946007)(2906002)(83380400001)(5660300002)(36756003)(66616009)(66556008)(66574015)(6666004)(16526019)(33964004)(316002)(478600001)(31696002)(6486002)(8676002)(235185007)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGpITkNzNEFRWG40VXlqcHVKOXErNGJuK2lQUllIcUdycmQzMkFaVTlTUXYy?=
 =?utf-8?B?ME1HYUYyRnRZVmM3MHVwUm0yUTZNWXhWSzN1UFZXeTNFUWJ4dytPYXg4NGVK?=
 =?utf-8?B?R0tucU5UejBWb3NpMFFlRjYyOERncDZCdmVVSW4wVFhieXQ4dGRTUmhvSU1E?=
 =?utf-8?B?ZnZyM24xbWJaelVRMzF3NldjaTFEL0xuU0UxV3VyVDJNaGQzeHhmbXY2cmpw?=
 =?utf-8?B?S3hPRVkvQlF5RGJKdFVJV0k5ZmY1bVlwa0VxRHhMQ1l4b0RGUlliczJGY1d2?=
 =?utf-8?B?Y3dwNnY2YUFzWjdpWnR0OE5rYlVaREpWY1FFUjc3endUaU40R2srNXR4VTRQ?=
 =?utf-8?B?N2dzSjhpRTZEVDNpK3dSSEZia3F3N2o4OGxoZ2VMM0lVaEh2YTF6cDJFNnYx?=
 =?utf-8?B?TENyam9SSlRUcFZlN0hBZHB4UzlLNnhzRnUycFVKNlBRNGhMb2s3aG1ZdWRh?=
 =?utf-8?B?ZFZTM0ZWZHJWcHNZZ3pmOThvZFQ2SzVYWmJyOVVINjNKLysvaEg0YytPd1N4?=
 =?utf-8?B?dFlkclg3WmF5NzJpZllmYVFaaUpSOHQ0bllqSTlSWWpGVzFjMGdMbHVlNXV0?=
 =?utf-8?B?WXVlK1hQR0dJZisxbDRGblBJWmkwSkM1QTF6M2pFRHd1WXRFcHgwcHpzdDQ0?=
 =?utf-8?B?MlkyZEdmY3VWWVFKNGV6anQ0ek1ncnNneU80c0VSZFpSbGplNmUwd0F4Nnhn?=
 =?utf-8?B?ZWxBb2ZJcWN0dGhhM3I3c1VHVWJNOXc3WnZKcGswTStEOTFhNWEvZDdZZ3Nl?=
 =?utf-8?B?UmFFK2E1YVUyanRBaHdaK0xYZWFlMXlTY0Z1cWdXQnkvSmdtc0cyS2dVb1pI?=
 =?utf-8?B?K21zOW1iSUZZcmFFTWZnblgrNGZJSjZYWklrUWxxbjl1T1prdGFhNUdvTmVQ?=
 =?utf-8?B?aC9EblA0WENJOVVMbjhCUE1WaTZXeGxpSmhkbnFPWmV0UHRVSlIxc0xoQWlP?=
 =?utf-8?B?OE4xcDVldllvLzNqbkpiRkpJVkMxK2o4QndMVmcrNTVVVk12REJhRC9oR1FW?=
 =?utf-8?B?OGFIRUtMb0tlOG11bnBWQkdlVmxidjR2Z1c5cEJmcXVmc2FUcHo3QnhrYXRw?=
 =?utf-8?B?SWYzNHFNZC9sWlJRcURESXJrRDYyOWtTZ1JMbGU4RXRPdS9VTkVwSDNBNlha?=
 =?utf-8?B?emdTRWRIdEk1YzkwaENtT0xVRU5ETDErdnkzS2Q3OERXaTlVck5mbVJ1eHlU?=
 =?utf-8?B?TEtFYklmS01CVDZvWVA1ZE5HRWNtWmpDTWpDUTBhT3FLVjJQMGQ0enVIMURz?=
 =?utf-8?B?eURFV0lvNkZkV0VSd2p2N3VTMlZUSG9yYWY4cEh5b0MyOHZMb3NPNDc4eS9u?=
 =?utf-8?B?YmovWG9VRHJSRnRqTWJSelc4REQ5c3RzN3dZNmdLRVBUY28rZTlWbkN2QVY5?=
 =?utf-8?B?b0ZYaHZZSzBsMkUwaFVtaE5PL3Y3dGhBMCtnNFh3ay9hMis0dlJhRmV2RVRB?=
 =?utf-8?Q?uZlvMmzR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138ca3ca-31ce-4403-bb71-08d892088bb8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 12:41:07.7037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAFnQH29Dc7+9iDLXyQvuE3jnXK6qT6OKpZJbnZdyxmCDd9qeZ99m9wjYVJDjEBi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4691
Subject: Re: [Nouveau] [BUG][NOUVEAU] G70 broken since 5.10-rc1
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--------------093077957EB13B9EC07936BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

Am 26.11.20 um 13:26 schrieb Mark Hounschell:
> On 11/26/20 7:05 AM, Christian König wrote:
>> Hi Mark,
>>
>> Am 26.11.20 um 10:59 schrieb Mark Hounschell:
>>> On 11/26/20 3:35 AM, Christian König wrote:
>>>>> I'm running an older "NVIDIA Corporation G70 [GeForce 7800 GT] 
>>>>> (rev a1)" card in a newer BIOSTAR B550GTA MB. Kernel 5.10-rcx does 
>>>>> not work. I get no virtual consoles or X screen.
>>
>> thanks for the dmesg.
>>
>> Problem is I don't have the slightest idea what's going wrong here :)
>>
>> The code should be functional identical, it was just moved from TTM 
>> to nouveau, so we are missing some detail in the handling.
>>
>> Can you run the following test for me: First you need to disable 
>> loading of the nouveau kernel module by adding 
>> modprobe.blacklist=nouveau to the kernel command line.
>>
>> Then log into the system over the network and run the following 
>> commands:
>>
>> sudo modprobe ttm
>> sudo bash -c "echo 'ttm_bo_kmap' > 
>> /sys/kernel/debug/tracing/set_graph_function"
>> sudo bash -c "echo function_graph > 
>> /sys/kernel/debug/tracing/current_tracer"
>> sudo modprobe nouveau
>> sudo bash -c "cat /sys/kernel/debug/tracing/trace" > trace.log
>>
>> Please then send me the resulting trace.log file so that I can 
>> investigate why mapping the framebuffer fails during driver load.
>>
>> Thanks in advance,
>> Christian.
>
> I hope this is what you need. I do normally turn off a lot of debug 
> features. Let me know if I need to change the kernel config.

It was not what I had expected but it pointed me in the right direction. 
I think I've found the problem, it's just an uninitialized return value 
for your hardware generation.

Please try the attached patch and let me know if it fixes the problem.

Thanks in advance,
Christian.

--------------093077957EB13B9EC07936BD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-nouveau-make-sure-ret-is-initialized-in-nouveau_.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-drm-nouveau-make-sure-ret-is-initialized-in-nouveau_.pa";
 filename*1="tch"

From 293d608f04f7be857739a7403adaf044dd6ef80a Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Thu, 26 Nov 2020 13:35:08 +0100
Subject: [PATCH] drm/nouveau: make sure ret is initialized in
 nouveau_ttm_io_mem_reserve
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This wasn't initialized for pre NV50 hardware.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7aa4286784ae..42292b3a6eb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1135,8 +1135,8 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *reg)
 			}
 
 			reg->bus.offset = handle;
-			ret = 0;
 		}
+		ret = 0;
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.25.1


--------------093077957EB13B9EC07936BD
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--------------093077957EB13B9EC07936BD--
