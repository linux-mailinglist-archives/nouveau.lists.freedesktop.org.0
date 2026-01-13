Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88201D19231
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:43:45 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 62CF610E4E1;
	Tue, 13 Jan 2026 13:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ClszXmZ2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9073844C99;
	Tue, 13 Jan 2026 13:35:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768311315;
 b=nl2F6EjzYoKgKNZ/LLbH17xubb0Zhu9wXBnuSd+p6bETbp5J8Y3Fi4qN9XrcuMKKZwSlm
 +7tSEanzmICehFf3K50ft/3+NfvDqXWmqWnrY7KnQUZ3IAhBOhGv9OuNOE7w2HHjL7ylOJ7
 NegWSw83UpFBq538SUT4oi75vST/YCFiFbAPI3fKkISPcFjdGQKpg5GUu8EfbswiHyhuUV+
 L5VvFBECveKd5C17/bN4P2/zNy0m28M9JE04u116Mqnn7brYPD2omg+tu50uShx9sYeyoJL
 CY+cjcCWGXiWFcSBMPANzuc4Y0pvnskbK7LyNsf9OsOd+0dcUCS0B/RY2Y3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768311315; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=A4TNe6j421Yo4W1jEO1CpDCEJiVJFSRg/kFKK5o7QQQ=;
 b=lVDgmVy+fmnKPpDgK30m7AzW+PicIL3xV2k+/7NRpqfG7aK8bCzXMgVMDoz21u8is7EH3
 tXerKea9KFMRrF/OdrOjI6zQn5nRDGo8j/fHVjA3OaJRfHZh9juG01mp8WD08xWJriqUU27
 Roobp/rS2XoyNspTiQXy5VShSjZ+YUPwBDKSMZhD3PQX7kiesaiIIo1EGShqTaYcBcj01bV
 hgxZc98gKxGBVtMyAAvA2bhlaT40aZrNgiQS7VJb7hYmd+OCvUHpsuroG5s9JHNLN5qsf9x
 llE/zpXsHnHFNlpJ/wSBjuaHosDTEHKQKxnsjFUpHxT7YljbAKzBPA3yP7KQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4F62C44C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:35:13 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA51210E4E8
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uglK4Oq4npj9mlt64uNug1sVJ4fKvry8il6CFIwuyDJXxyJfbuy4BzR3RpUvkL4seN5yHD+NKeYap9Ebz4TmQ4p1XkN1a4ugZ1zCPEaoyb8bJRY8braB7DKbjN18Id77TwywDzragDWLahCN4ibn/LWDUQ1KiiDPHDLVb57hCb7abRzE8K1nUcD7TDg0zbISejNsgWtkdbhQ0ts+sKsVMygpQlG9iFLHrtqTxqQlxFe1k1UuaIL5HPYdzJeX4a7btXWz4jq6tLG1KkwniP3jB561NqVdi/Evs1JCbalKFdJP5oH74JS615Q8J4sw5mvRZatFXy6rCFdWtW4ugffmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4TNe6j421Yo4W1jEO1CpDCEJiVJFSRg/kFKK5o7QQQ=;
 b=ZSCaYL2q9ZcDUgZ3XaCcYpd+mo0ZWl/8yGxaGng8bc18FGNSIBqFDjxfZAmuRYgMLUnFlMQV8sUZbXagiH6X7Q6q8UGM8ByX2/zFKYoz1a/tDWw/Iq+zS7t2KyvN6/NvF0RLKS3BOxUMRvRJR6mabhteSIpgZQr2TzqWhqj56PrabmnkfaWktcTF9eNyIH6Vh6yhXw8qQKfFlwtGQTnPcXV9ZSShH6r+iAsVsr8d6MtSW36vyxNAWem4oOobOs4TD5KKkORGZhKeZsmhxk11lp62iHG2BqKzlv0Qu7ZTkFzp/+yc+aughrePnFOS47jkdo+YabLnXeT7uckRgbBleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4TNe6j421Yo4W1jEO1CpDCEJiVJFSRg/kFKK5o7QQQ=;
 b=ClszXmZ2vB50CgchMoKPWnsYR1f6HKC5p9cYrcStRrTQ5hbIUiuLwULIGTko7vmOXUMbe55RwjpCbUdAeVVhXU5mn7Higo2qNIXcQgmPRtw8atSp5masT5Yh2uI/vSsvfZ14IdR8RlYMJPpkEOvwLzQHj+uwHQSDdWsfnHR4RpU=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3593.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 13:43:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:43:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:43:37 +0000
Message-Id: <DFNI82AQBBUV.1I49DFIO8072F@garyguo.net>
Subject: Re: [PATCH 07/31] gpu: nova-core: set DMA mask width based on GPU
 architecture
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-8-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-8-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0236.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3593:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7eab26-bab2-4cd6-4066-08de52a9c176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3o0cWFZWVE4Q241eHFyYzAxc0owN20zR3VwcE1PNzB4elBmSjVhV0RTeFlI?=
 =?utf-8?B?eEJ3R3AxK3dVKys1YXIwNG8vMXNibUNISU03bDFPNDhKdVhxUzA1Znc2Lzh4?=
 =?utf-8?B?U21kK1B5QTRWNk8ySzIwV0QvaEFQajR3QmpwazNYdTM1SE1EaS8wZGEzRFpB?=
 =?utf-8?B?Yk5qejVlZ2paVDF2SkEzSTBqOUpZcVlMVkJTeGxBNWFMQVBYVGpQdU5qbUZ4?=
 =?utf-8?B?NC94am1aTm9aMXpuYnJubi9RVnEzSUVDYitWblNHSFFVb1libUFLWEVycU44?=
 =?utf-8?B?OXluTkV3WExjeHluMHlOTEJzcjkxRS8vMXpTMzdjQXExNmYxYXJOR1V3N0VR?=
 =?utf-8?B?SDJBLzJDTk5ndXZBK0tZbVZEbkpPNmVveTFIdnlLY3YxZHd0TTY4VnNxbjBy?=
 =?utf-8?B?b0JTb09QN2VNbjJZK3kwYm02K0NYblVOREZkNVkrYXpnT2hGdktNVlBtanll?=
 =?utf-8?B?MldBc1NmczFneGtsdEFETzIyNytBYUdFeTkwYjVpTVJHenFlVXNjbjMwb3lr?=
 =?utf-8?B?T3YxLytIaW1mNW1GMmk4M283Z1VJOTJJbnZpWEsvL2tUWEpPaWxEVmg2VEtm?=
 =?utf-8?B?dE94V2d5dWhnMG5sSVhaS3c1Njg1dmZPRGduUEluUWpzZE0zd1gvNERTZk1v?=
 =?utf-8?B?QVN1aU96Q1FjeEF6bVRzM2o5NVB4blF1Yk1tWkIrbXdmaXRlczBxcldFbzhU?=
 =?utf-8?B?TGg0T3lWOFpiT2w0MExqT041ZzBWcVNvc0s4RytHWUg3a252c092Y2x1T0Vw?=
 =?utf-8?B?TXcwZkhEbXdGRDhGL2xxUnRpcmR0bFlIQjJBTGFLUW9uQ3NBdFFFMVdPMVdt?=
 =?utf-8?B?UURpams3YXV6MWFBSE1keGpFVm55OHdXK2hMV2xJY0pDNXVmQk5rUU5zYUcw?=
 =?utf-8?B?d2tlbWhBZUNaT1hnOTMrZE9sWTc5M3V6NE1rMGtNZi9KQlhmVFFVenNGVExj?=
 =?utf-8?B?bVF1RkVzalV0QXdiY3A1ak5OdGpzbzljZjV5cnptMXdiTFd5U0Z4R2FlLzBH?=
 =?utf-8?B?NHp1QmhCeEVWVWxjdlpwMnRmYzdaNWdZdmRiUDhZVER0SXEwK0lNNDFDMk5q?=
 =?utf-8?B?NWlOMXQ4S3dtTmU5WXhrc215bUEyR0kvNE9MVDZGYWU5MEpSSlFDVjFWcURK?=
 =?utf-8?B?UTA4ZzZyYlYyeDNTWWNTMi9RYzV4elR4Q2RiQm1QVVByYmJyRy85YzNOa0VE?=
 =?utf-8?B?K0U1Q3FyVTg2SzZaTE9tcDhxeWV4K2RuVmVSVUNHcEpHQ3FxV01JZXpHZEpK?=
 =?utf-8?B?WTlXWVdYb1F5TCs1YmVCcm5DeXRGTGxGQzBpZnFvK0RuRExlcDNhYk9sMHlQ?=
 =?utf-8?B?OGVjV3RSaGVscFZ6Q0IzRnh5M2lzRXJzL1JFenlteVhHcDR3dDhtaEN0RjNS?=
 =?utf-8?B?VG03czNnZG5xYkdlS1Y5d0FsM2thOUp1cXdtbFhDakY4cnF4MUFrTXdDRThy?=
 =?utf-8?B?aEpFU2FvcmJoKzdpQ1YreHdiQXFpUG9FSStVM0JwcENJczdULzY5cU9NV0lo?=
 =?utf-8?B?MW0rQVdmUWQyNERTNGdZYlQ0aks5MHFNQndDYjV4UFE4WmF3dUNJTEZ0R2Z3?=
 =?utf-8?B?RW5hSDFsYUN1YUN4OFRQUWd1TTRXNFkvYTZNY2lJQTQ3ZEFtTFdSUVlOeXV2?=
 =?utf-8?B?L2Vtb1FGR3ZvU3JTTnZ4MHlzckZZdmJoN2F0dlpBbmZUV2xsVzRSa1F2NTdr?=
 =?utf-8?B?WFczZ0VoNVNlekFxMUp3cDExem1NWjJ3eGxheHNxaU5WTVZQa1dNZVh4dkpL?=
 =?utf-8?B?bVU2aWNqdU92My9LSWRCeGhGaWt3NktKY2E5UzNZYnA0bHlMRExKMDQrVDVo?=
 =?utf-8?B?bkFZZ3hiaUZkTVBUUkNiNUxLUlFjZzZCdk5seHFaVmYxemIwaHNFdzRLMWRX?=
 =?utf-8?B?bnBtZ3UxK3FENjM0WWVDblNrSTA2eE5ENFVGb0xsaUtENUltck1hdU5XbkJQ?=
 =?utf-8?Q?IPArG0nucxGXfXX/ktlgYhRy/uhSDF7U?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2F6Zm80WVF2bGFpWGdLSXRMZ0lRb0kxT2Jsa2pMSVpTV0phQmdkVVJSU1Ri?=
 =?utf-8?B?RzVHMWloVWJzc0lJSWlsMk02bEVZT0pGVDdwdHlwQzU0MHRIVVEzL1o2bW1B?=
 =?utf-8?B?YlZGcTRIaGQyQmFRcXhFNEdJdEFBYmsvMkIxc1A4SnpRdjhiRVdNTG02dldp?=
 =?utf-8?B?UkRaMmdyM0l3cnIwN0NoZjJLZ2E2ZzhDR2lzYXN1c1dBVE5qZE5VYms5ZzBE?=
 =?utf-8?B?TkwwaVpUby9OczlBWkIvMUlTZTYra0E5VDFnWGNFYWxhbnlHSmMyTEsyZHBs?=
 =?utf-8?B?WW1ibmxJZzc5Tll3WnVzZEdlcnkreU9SZzYyNHo3MVpEdTJsTms3Nmx2T0xy?=
 =?utf-8?B?OFFCbUlRSFVoOTB0TWlGVi9PdGxmNmM3d2QxLzdPbThlaEZleFZ5NXM2Vmtn?=
 =?utf-8?B?YzhycEFHQTJYQm50MkxsRGpiS01qVXNvc0tjWE91NW1Cdy9iTzNFTkcycmRW?=
 =?utf-8?B?Y1hTSVEram0wY1NKRHFHZzR3RjBwTTFodmhXNWtnWklJN2g0UFIxRTdURkJ4?=
 =?utf-8?B?L1pyVTRJc3E4UFM3S2p6NXhxck02K0FGYmJXZExOaCs1THo3dFREc3RpQ3lu?=
 =?utf-8?B?d0p2K2JNaTlPdHJ6SVBYSHZOejZPSHN5UEVQYjZicGFkNm5IdGRVUG1XM1Iw?=
 =?utf-8?B?eGhXRkFKcHJGdlZDODFtakpqRk9MU3ZZV2ZUTzUvZ0hiUmFyMHErUDQwQUNx?=
 =?utf-8?B?R1hPVEhBdTQ0UE95VyswVVFjVmtMOVgxTXo4OHNFUXZsdFk2bE82UjdiZzJL?=
 =?utf-8?B?Zmd2WXVCbXhzK0RoWSs5Ykh5eW5YUGtxRUloRWpxOWFxM1dKV3ZnWnBiQjho?=
 =?utf-8?B?dmVSc2hHN3l6dW00ZVFGVGxJenJkNUNjZ0Z5dkc2Q29FTXNCNnZ0WkgvZ2lo?=
 =?utf-8?B?c3N2WlRsVjRnRUJSK2ZJejU0WmpGUGE5RnFMbUYvWXVscXl1NHhwSU5VdzF0?=
 =?utf-8?B?bjNOTGJHYXh0ZFl1NThtMVRvUm5CUElDSVl5NG91L3JNZjZxd2tJT2tKekVy?=
 =?utf-8?B?ZXFCWlNoOUFGM05ERmM3NTM0TTBaWkxIeDQ1VFNxQkplUDByK0xrK0ppakY5?=
 =?utf-8?B?Zm1EZ1VuL2c2Q2VnRlA0UjFGKzlvT0dJejMxckxXVDJUREdLMXRFcU14RjNm?=
 =?utf-8?B?ejNWeVJ0ZGwvMlF6OS9JT1VjaFJTWG1xT0tOeWNxcFo3S3hGYk0yTy9NYktT?=
 =?utf-8?B?QUREWmlnY3lmTVBOSzAya0orbmU1NkwrVXhFbXZBSnp5cVFzdnBUVmlDVlgx?=
 =?utf-8?B?cUpFOXljTmZURVBQZ1pLZ2IzK0J1UG9uTmtva0VaWVRiTFJRU1pZdXk1b2cy?=
 =?utf-8?B?TEhrWWwrbTBJaWYrWjZHR256VUlEOWNBYXdwb090R3hEdEpmZThsSjhtWUZt?=
 =?utf-8?B?eDRyNUNqRGZxYnUvSmZhWUJLcWVITHNYS2p0b3B5cEk3d0t5ZGlKRHZYcDY3?=
 =?utf-8?B?OGRDcnZKWWkvOXVZSDRhd2NFNzlneU5tMU9EUkRSZFpXbFY1UHdZZW9sMk1D?=
 =?utf-8?B?ZU5GMHU4SDJWYW1yME1uNkYvLzAxQXdsaXljWnQzbHlXUThRU1JDYUsrakJr?=
 =?utf-8?B?SThLMFJxeTBNdHYzRG1ucmZYa2JPeVFxdTRlaUE3bzVjYUt5SklQMWt5NGw2?=
 =?utf-8?B?MU8za211WWJua3cxVGExaHZlZHRUVGJ0Z0FLM2JkZER4K3JRNTg5aU1nVEQ3?=
 =?utf-8?B?ZG04WDI0U05qWFBhK3E2RTZjeGQ1aTdpWm9LUFZEMnJFQTJzYmpxZExOdlhU?=
 =?utf-8?B?R0QrOVIreUJ0VlFsclRObytOMzQ0TUtqYmtRS2RiZDhoR3FwNmJ1aFlWWXF1?=
 =?utf-8?B?RWVVQ3U5MTNpbW4xLzB1NHM4VVhPMG5IMXpZQnc3K1EyMDRqQkxBa01MR3BS?=
 =?utf-8?B?a1pBNnduNUhjWDE5ZWdzN0w5OUdJZTJDWElQRGtpVEhTYjMyS3M0VmdhdXpl?=
 =?utf-8?B?Tmp4NkNheVg5bjlBQml1QkJCVHhvT083cjF1ei9zR01UZ2Z0Z0ZUZHU3UXNx?=
 =?utf-8?B?cWlYNmVOcHBJTGJWUE9YUURXL0dubTU4UEo5Sm5MLzlxRU02QVNCNzQyZnY4?=
 =?utf-8?B?U2VBeEcrUG5LTGVCWlc4MGZTeEZxNG1qa3BhdUlZZXFMVHNLTExRY1ppZnNm?=
 =?utf-8?B?SVpyWFAzZzBvQU1nODdqNDQrVy9RSGZFd3ZCcC82YlltUUVmZURHUHRBbnIr?=
 =?utf-8?B?dU9YNGtNWVN3Q1NjRGlkZy9FWEhBQkJ0anZ6em1XZzZhK2F0MnZVbm42Rm5h?=
 =?utf-8?B?VzEyN3ppRjJYM3cxaVEwb2FQem5acjNPcjZnU01zM0E2N05ZK21ScFpWRG5E?=
 =?utf-8?B?VTByNFFSSXQxWGowZHVmTTZOY21IWkszTUYrUkNoRWo3YWQzaVNQUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0d7eab26-bab2-4cd6-4066-08de52a9c176
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:43:38.2494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EDzhr/ymC0xIma8opXduJgSuXV5EPh64CfKzZ/2O8DL4ho+CA0qCkNcvbRewQvQuOgt2Mm3sFsMNdpnGuhQnTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3593
Message-ID-Hash: QWOITB3M4AX6XCQYBYMQJCX6CV7WMMR6
X-Message-ID-Hash: QWOITB3M4AX6XCQYBYMQJCX6CV7WMMR6
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QWOITB3M4AX6XCQYBYMQJCX6CV7WMMR6/>
Archived-At: 
 <https://lore.freedesktop.org/DFNI82AQBBUV.1I49DFIO8072F@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
> This removes a "TODO" item in the code, which was hardcoded to work on
> Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
> early read of boot42, in order to pick the correct value.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 33 +++++++++++++++++----------------
>  drivers/gpu/nova-core/gpu.rs    | 29 ++++++++++++++++++++++++++++-
>  2 files changed, 45 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index d91bbc50cde7..3179a4d47af4 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -4,8 +4,10 @@
>      auxiliary,
>      c_str,
>      device::Core,
> -    dma::Device,
> -    dma::DmaMask,
> +    dma::{
> +        Device,
> +        DmaMask, //
> +    },
>      pci,
>      pci::{
>          Class,
> @@ -17,7 +19,10 @@
>      sync::Arc, //
>  };
> =20
> -use crate::gpu::Gpu;
> +use crate::gpu::{
> +    read_architecture,
> +    Gpu, //
> +};
> =20
>  #[pin_data]
>  pub(crate) struct NovaCore {
> @@ -28,14 +33,6 @@ pub(crate) struct NovaCore {
> =20
>  const BAR0_SIZE: usize =3D SZ_16M;
> =20
> -// For now we only support Ampere which can use up to 47-bit DMA address=
es.
> -//
> -// TODO: Add an abstraction for this to support newer GPUs which may sup=
port
> -// larger DMA addresses. Limiting these GPUs to smaller address widths w=
on't
> -// have any adverse affects, unless installed on systems which require l=
arger
> -// DMA addresses. These systems should be quite rare.
> -const GPU_DMA_BITS: u32 =3D 47;
> -
>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> =20
>  kernel::pci_device_table!(
> @@ -73,11 +70,6 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInf=
o) -> Result<Pin<KBox<Self
>          pdev.enable_device_mem()?;
>          pdev.set_master();
> =20
> -        // SAFETY: No concurrent DMA allocations or mappings can be made=
 because
> -        // the device is still being probed and therefore isn't being us=
ed by
> -        // other threads of execution.
> -        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_B=
ITS>())? };
> -
>          let devres_bar =3D Arc::pin_init(
>              pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/ba=
r0")),
>              GFP_KERNEL,
> @@ -88,6 +80,15 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInf=
o) -> Result<Pin<KBox<Self
>          let bar_clone =3D Arc::clone(&devres_bar);
>          let bar =3D bar_clone.access(pdev.as_ref())?;
> =20
> +        // Read the GPU architecture early to determine the correct DMA =
address width.
> +        // Hopper/Blackwell+ support 52-bit DMA addresses, earlier archi=
tectures use 47-bit.
> +        let arch =3D read_architecture(bar)?;
> +
> +        // SAFETY: No concurrent DMA allocations or mappings can be made=
 because
> +        // the device is still being probed and therefore isn't being us=
ed by
> +        // other threads of execution.
> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(arch.dm=
a_addr_bits())?)? };
> +
>          let this =3D KBox::pin_init(
>              try_pin_init!(Self {
>                  gpu <- Gpu::new(pdev, devres_bar, bar),
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index c21ce91924f5..624bbc2a54e8 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -102,7 +102,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> =
{
>  });
> =20
>  impl Chipset {
> -    pub(crate) fn arch(&self) -> Architecture {
> +    pub(crate) const fn arch(&self) -> Architecture {
>          match self {
>              Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self=
::TU116 =3D> {
>                  Architecture::Turing
> @@ -155,6 +155,19 @@ pub(crate) enum Architecture {
>      Blackwell =3D 0x1b,
>  }
> =20
> +impl Architecture {
> +    /// Returns the number of DMA address bits supported by this archite=
cture.
> +    ///
> +    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier=
 architectures
> +    /// (Turing, Ampere, Ada) support 47-bit DMA addresses.
> +    pub(crate) const fn dma_addr_bits(&self) -> u32 {

How about just return `DmaMask` from here? This get rids of the fallible
constructor call of `DmaMask`.

> +        match self {
> +            Self::Turing | Self::Ampere | Self::Ada =3D> 47,
> +            Self::Hopper | Self::Blackwell =3D> 52,
> +        }
> +    }
> +}
> +
>  impl TryFrom<u8> for Architecture {
>      type Error =3D Error;
> =20
> @@ -203,6 +216,20 @@ pub(crate) struct Spec {
>      revision: Revision,
>  }
> =20
> +/// Reads the GPU architecture from BAR0 registers.
> +///
> +/// This is a lightweight check used early in probe to determine the cor=
rect DMA address width
> +/// before the full [`Spec`] is constructed.
> +pub(crate) fn read_architecture(bar: &Bar0) -> Result<Architecture> {
> +    let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
> +
> +    if boot0.is_older_than_fermi() {
> +        return Err(ENODEV);
> +    }
> +
> +    regs::NV_PMC_BOOT_42::read(bar).architecture()

Can this just be `Spec::new`?

Best,
Gary

> +}
> +
>  impl Spec {
>      fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>          // Some brief notes about boot0 and boot42, in chronological ord=
er:

