Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07971CBAD19
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C368F10EA44;
	Sat, 13 Dec 2025 12:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LYyJO9nj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1610EC33
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 14:01:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JCVfr5002454;
 Fri, 19 Jul 2024 14:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0iOXd/KnUcqhuwFmJpV0aD60W+/rKAO1g0GIgi7G9dU=; b=LYyJO9njjal2idWQ
 pHOhc9v48Y3mFXXbo69osK52dhN/D2QEB1m6pC0VT4I8cWFE6izJVlgjMwNnXolR
 ukdcCv907hcFc3z5BaSFy2wnlJpSuGYRw4Zt5qMUJhnOF3k0Ds/1r/rAEu3sMBaR
 milE/AgVpodAQ976/mWxTO9CfzNtOrQiai5WaOGn08hjuBVDuDDa8bKhY6RgDjRz
 p0UGJ/xbZv/pSTN8VVHBMVXj7UhG3xtqyRdt6RhNvIdiwv66z5tvUIMNbRA+R7RN
 FdN5SwAgonLbrA6yAjkBbAsg38Q2rnC1O4iKS7dmylnlLecD8O8nA19F7zuFDW9u
 j62hpw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe94sm9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 14:00:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46JE0J7r027068
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 14:00:19 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 07:00:18 -0700
Message-ID: <55341a0d-b07b-4f25-be45-dd0b352315aa@quicinc.com>
Date: Fri, 19 Jul 2024 07:00:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MODULE_DESCRIPTION() patches with no maintainer action
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Russell King <linux@armlinux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen
 <ppaalanen@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
 <bdac7f10-4c65-4be2-952b-aed1af04e2c9@app.fastmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <bdac7f10-4c65-4be2-952b-aed1af04e2c9@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sg1Ff6mAFYU0BUKqF12MoFAl9ng0bFVC
X-Proofpoint-ORIG-GUID: sg1Ff6mAFYU0BUKqF12MoFAl9ng0bFVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190107
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

On 7/19/2024 3:51 AM, Arnd Bergmann wrote:
> On Sun, Jul 14, 2024, at 23:46, Jeff Johnson wrote:
>> Andrew & Greg,
>>
>> I hate to bother you with such mundane patches, but the following have been
>> posted for a while without any maintainer or reviewer comment or action, and
>> they have not yet landed in linux-next.
>>
>> What is the path forward to have these MODULE_DESCRIPTION() warnings fixed?
>>
>> arch/arm/probes/kprobes/
>> https://lore.kernel.org/all/20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com/
>>
>> arch/x86/mm/
>> https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/
>>
>> drivers/spmi/
>> https://lore.kernel.org/all/20240609-md-drivers-spmi-v1-1-f1d5b24e7a66@quicinc.com/
>>
>> (note that beyond these 3 patches I still have an additional 13 patches which
>> need to land in order to fix these warnings tree-wide, but those 13 patches
>> have had recent maintainer or reviewer action so I'm not seeking your help at
>> this time).
> 
> Hi Jeff,
> 
> For completeness, this is a patch that I have in my local
> test tree now after I addressed the build issues for all
> randconfig builds on arm, arm64 and x86.
> 
> I assume you already a version of most of these,
> but please have a look in case there are some still
> missing.

You have found and fixed some that I didn't encounter with make allmodconfig
builds. I do have a list of ones for further analysis that I created by
looking for files with a MODULE_LICENSE but not a MODULE_DESCRIPTION, and the
ones I haven't yet fixed are on that list, but I'm very happy for you to
submit your fixes.

Details follow:

>  arch/arm/lib/xor-neon.c                         | 1 +
https://lore.kernel.org/all/20240711-md-arm-arch-arm-lib-v2-1-ab08653dc106@quicinc.com/

>  arch/x86/mm/testmmiotrace.c                     | 1 +
https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/

>  drivers/fpga/tests/fpga-bridge-test.c           | 1 +
>  drivers/fpga/tests/fpga-mgr-test.c              | 1 +
>  drivers/fpga/tests/fpga-region-test.c           | 1 +
I do not have a patch for these three

>  drivers/fsi/fsi-core.c                          | 1 +
>  drivers/fsi/fsi-master-aspeed.c                 | 2 ++
>  drivers/fsi/fsi-master-ast-cf.c                 | 1 +
>  drivers/fsi/fsi-master-gpio.c                   | 1 +
>  drivers/fsi/fsi-master-hub.c                    | 1 +
>  drivers/fsi/fsi-scom.c                          | 1 +
https://lore.kernel.org/all/20240605-md-drivers-fsi-v1-1-fefc82d81b12@quicinc.com/

>  drivers/xen/xenbus/xenbus_probe_frontend.c      | 1 +
I do not have a patch for this one

>  fs/adfs/super.c                                 | 2 ++
https://lore.kernel.org/all/20240523-md-adfs-v1-1-364268e38370@quicinc.com/

>  fs/exportfs/expfs.c                             | 1 +
I do not have a patch for this one

>  kernel/locking/test-ww_mutex.c                  | 1 +
https://lore.kernel.org/all/20240528-md-test-ww_mutex-v2-1-a2a19e920b12@quicinc.com/

>  lib/asn1_decoder.c                              | 1 +
>  lib/slub_kunit.c                                | 1 +
>  lib/ucs2_string.c                               | 1 +
>  lib/zlib_inflate/inflate_syms.c                 | 1 +
I do not have a patch for these four

>  mm/kasan/kasan_test.c                           | 1 +
>  mm/kasan/kasan_test_module.c                    | 1 +
I do not have a patch for these two

>  samples/livepatch/livepatch-callbacks-busymod.c | 1 +
>  samples/livepatch/livepatch-callbacks-demo.c    | 1 +
>  samples/livepatch/livepatch-callbacks-mod.c     | 1 +
>  samples/livepatch/livepatch-sample.c            | 1 +
>  samples/livepatch/livepatch-shadow-fix1.c       | 1 +
>  samples/livepatch/livepatch-shadow-fix2.c       | 1 +
I do not have a patch for these six

>  security/apparmor/policy_unpack_test.c          | 1 +
https://lore.kernel.org/all/20240529-md-apparmor_policy_unpack_test-v1-1-9efc582078c4@quicinc.com/


