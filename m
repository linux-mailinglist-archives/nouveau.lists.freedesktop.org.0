Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B3CC1E7C
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 11:04:39 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8851310E7B7;
	Tue, 16 Dec 2025 10:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eRyOnpya";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6CA6F455A6;
	Tue, 16 Dec 2025 09:57:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765879031;
 b=obrPfDCTySEFa3U1T/GeQKJkMcHH1PkhhCHk3ZAJNmADpWM9Jio3ScyqEsRk2cvSnxhgz
 B3RkkqmyCwMvJk11tzzJsFglhiWA+9vpmpKLt8Wmb5RnIaoBnbPPmfu9yx7bCmkxq8CWepK
 YDT3ePikxxpBLj2zmK1AdqNDi5zB23xg6SPLoUOagsKEe2F2UdXaknFzcmNh14LmTaJu8w+
 Xn6VM/+juJ/0euK59S7P/bSa1gOyqf/BrP/VxYeCnKuUmyGT6zYxjn4UzOBX+t7wJkyj9l9
 ARhIbqza+2D99RdMTniRO5XLnRF6yPtJnrzPNi66r3Jibwx0C+O/0ZVmpLDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765879031; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xoEgJmXmVWYvYLYIRLddJwe4CUJApiQnMAzlC0mJjAk=;
 b=dZGIMg3HjOlG13BE48D0MFFCfrJW2WWO3u1PYj1xJ51nr1HZK4mB3xkduEgwNki+TECx4
 KilmH3UkQp23Qg6iIZzLoNrpGi6ws4jTX0eRyFPnVrZwMViKoOJrgk3VnkOeD7WwUymbR79
 flvYiyo0PfsLWpgzpCbRM/UGqzrtWZ468+vjZyx1W80wstjNAM860wyy3jL3v/Rv7LSeEOM
 zGXC/uuUm1+5fieh0/dsjjcmtQgaBSBXmCdYbe7DffhXvSIX6nuIVIldtAhDOsnBML4C9ET
 0MeMB969YDC4Mv6i2CHIW9QURsvRaCMOQlZUVOVFdbtEypoaoP0bpo3lnI1g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B99AF4554C
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 09:57:08 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C06710E2AF
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 10:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD38FGjkwm0BkEOvt6M1PtDqotPOinPDW3AkCSJ8lc4RO8EMV7g239EytAtXWlzsQQYFvxRCQdSIVkYoOZUuuG7bSQ5UbuuF2oq0bmIpcDc1hkPa3NN8clN5M84Te5tPkK8PuoQUhb5OCbptmegJCa/rnFY1tkS3G3bEAsSD9KCmmHYQHq6BDgTyLJp3av64YDxXvdHfQtcP29eKOnEnoEW25rCunCgrNskkyxH0x80uTfuPCkXuwahknWo848EQF84sacpUffKo5GIGbTTrDq1eiemkeIpcHrkrYkUyrD1nohVpFUVx22l2ChAyJoq8VPoc8Vo0VbrPwNBtAESQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoEgJmXmVWYvYLYIRLddJwe4CUJApiQnMAzlC0mJjAk=;
 b=Cyv4e75LiaL591q9yNH6jTlwITLfS1rsS2ZcNH4ZKmScBiqt9MbGN27k+PG5/IuXf28F/eYAbXHJgzVn3HFjFKS3jMfSRdUe1J4gSt5RI8OkeZXebmqym2X7faCEfRJYbv4kNqZrlKypqOsesaUlmFf4VIw+FVqraXK2dzQ0MzEO7pexFxPnA2iwa1W6Sy48q/qyWUUf9DtnWHWrTinqoF8HVlFrASkvbAHyQGRKfjqbwpFIZ7l9N1B2p1FAvKwZ0zoqv6/Od8h1Y62WKba2z8BNMeH5/K8iMuTzlIQcHN7XUcvVbIieGPX4DkL/0lXo2eGcTSnvAOb5fGsyZhxuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoEgJmXmVWYvYLYIRLddJwe4CUJApiQnMAzlC0mJjAk=;
 b=eRyOnpyal0rXwFHdHDalKRpbP1fb+P9Rv5rb/orOUfScWWYanGlg+OhrfhvlzQduMxlyGYFIfcHqhNqhbik7/7lnCUiKXuoJW/4LGOs7nSnqWBgCxaDkpefbus71KUoG2jyrV7CUI2f80xargVUa4TKG+6Y442oY3bHZ4d61dCtX4fD86BztwLJZOuk0sKEHGYG/IiI1wzqETy3XRiewHIGNqO9Xb3I+U/4jwuXiz+GhdYgXKKOc5N1xqtVWs+XkdVUc5MIgsMQV6nW/uUko6slT2OtHiSEwC7srBsnDUIAaoURBe3D9noqyISSeYDGnXgN6d2sHTv5Mmw31PvlltQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 10:04:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 10:04:30 +0000
Message-ID: <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
Date: Tue, 16 Dec 2025 19:04:21 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
 <20251212204952.3690244-4-ttabi@nvidia.com>
 <20251215114036.302303e0.gary@garyguo.net>
 <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: a6031661-e4c1-4593-ea35-08de3c8a811f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDBCbHlnVmFLVi92QTV6ODYxaVZ6YVJLT1lHYTBqZmhNV1dGOWE3YkVZOUd4?=
 =?utf-8?B?cVRCNXhqUUtDdFgxRG9KbHQwc1FNbmtHSm84bzhOZFh1NXZVS25KcGM4ZVRX?=
 =?utf-8?B?MkNRa1dobjdRZlJzOHI4RzhaaHkyR3NDRnpxUUlkSzBJQ1BCQWF1RlVHdzVP?=
 =?utf-8?B?YzF6NUwyK0dWLzY1T0F1dERXMXFJbW5wRHcxLzhOdnBTYlNuQTVmU1RIbGhQ?=
 =?utf-8?B?Y2pqR0lSYnNEeFphdTBqa0tJTk1CVksvL1VhUUJ4ck84VUhxbDU4eHZFZkZQ?=
 =?utf-8?B?TzZmSEE5RVFUbTZkcGRoN3d1RkdQdUhaNVFTTTgwcWRKUnJWbjNyanlLNGln?=
 =?utf-8?B?SGkxd1kxYTlQOTRXSE9tOHNndFF0emJvcERqQU9hSFR0eWxIT0JHQnVvUm1x?=
 =?utf-8?B?UDJra1Qydkh6Ri94OVRIVm9GUVBqN25lMTR1bVl5ZVRPMjg1N0lUaE5NZ0hj?=
 =?utf-8?B?Z0FHUTQ3RG53MlZwSDllcVpyL240Y2YxMnJWVHNpZHhYdk1uRHRTSG1aMllB?=
 =?utf-8?B?TE9lR1hWNHFnWTdsMDRTaWVKVmM4Y01SWVVMSzAvNXdKTkpNSHg4RzlleFJa?=
 =?utf-8?B?WE5jbTEyUWFETktKTUlLTVFzTG1WMHJ6ZElCRjE2cVhsdDg3aXlvVUo0dVox?=
 =?utf-8?B?ejhPczByUGE4NXJiWVZQZTdESnVMOVcvR0FocS94NCsxb1U3RS9GTUozc2c5?=
 =?utf-8?B?N3piTHNRQ0tQeXMycVFrKy9xc0V0SEpCNlh5WkdkRkk0cjZjVlg4RzZ6S1hN?=
 =?utf-8?B?NFh6Umg3QktKdkhOMmlUY3VibitaOEJXa1d4c3VtYXlZQXlZd0l5U1FOL0Nk?=
 =?utf-8?B?MWNWckYyMnJEckprRnVxaWRjdGlwdW1qbVRkK29zcVN4d0xwU082UzNKeGZG?=
 =?utf-8?B?dEFDWjFid0l5Rnl0RndUam53OTZ0MG12RnI3VE0vd3VQTGdYcnRUQlczbExK?=
 =?utf-8?B?VldkWDZyZ3ZsVTE4eVVSeDFHRHdFOFlFcHZsZG9LOUd0cml0bitYTXdFWWVN?=
 =?utf-8?B?NXR4RWlCekRWOEpTZlFoMHZvcFV6QUI0VldRWFRaT0l6UTJGakZGMUhoSll1?=
 =?utf-8?B?ajFtWm9sektKQS9KS0haNGJGcytBTVF1bjU4Q1RPbTdNRDBtbDhDaFlPYllt?=
 =?utf-8?B?bHFtKzBvaGtmRkFxS2k2MXhyMzZsbDlSSXdEZTQ2aVBlSTRGUkFYKzJyakN0?=
 =?utf-8?B?d2hUbVZYeitRWUdEN09rOUpwTSt0emN6UTVnMDA3eThkSnM3dXRuMDJxdXdw?=
 =?utf-8?B?Tk83NWdrOVpxUy9LOTZDcDB4V3pqbFFOYjNuRVNWVkVIb3RrdWsycDZRWUNz?=
 =?utf-8?B?Y1JwQjlETkxVSmdMUWZTWUVUeEpCcDNtVUJEbkRKUnlnNVAwL2lMYzlwY0pQ?=
 =?utf-8?B?VU5CcmlacFFuaFp4TkY3Zlhvbm0yZ3ZkdkhYRDh6RGIvMWJWRllra3phSnNY?=
 =?utf-8?B?Y3JqQ0lLdGZkYU93UjY5OFBtbzNXbUlVMTlsWldCUC9NMnhFSThsMThiUGNv?=
 =?utf-8?B?UEdjeWhORUt6Ukp0ZVhQK29qSlFGYWZzWGVGOGtqdlhXUTYxUjkyYWs2THBS?=
 =?utf-8?B?Q0xtejU2dTJvbjdQQlorNzNKbElUZjNDRTJkN1krUTdXVkx6aGROSmY4OVVH?=
 =?utf-8?B?RmZxZUpvY1ZIczFIREs1N3FFMGx4Ym1Ja3pZZW45MFBSdU5ES2RDaEhlTXpl?=
 =?utf-8?B?ZTZzWWdtTVNwNFdSMnZPK2dKU2dpNUttbVNDcSs0c2hNRFJGamRsU3lEZlU5?=
 =?utf-8?B?SzJnaHl5NzQ3ZVU5UW9yS3EwTWhLK0l1cEdOQlE5dzZmMWpIcG40TU5ZWEha?=
 =?utf-8?B?ZDFUaXQ2YjB3a3pCZ2drQ05KUExHNkgwWCt4bWtFejJyNjJLYjN6VEMxbkxH?=
 =?utf-8?B?ck5sU3J5R1NTNHdYOFhZQ1JIT0pKeUlleE9kcFpIREQ4TDdtQkNJaGliM3Js?=
 =?utf-8?Q?URyHDxJOPB04b7/A1gQa0fYxF7sFQXgI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STNad3BUNFhabytrVWxwUDcvYllRWUw2NTNMYXNrUWlYWFBqMkh6WXBJMG1Y?=
 =?utf-8?B?TVBGdU0rZWFnMTRnODZBZEVaZkUvRlptOGdyUjNyeDdxS0lCNHhEUGZMWDJU?=
 =?utf-8?B?QmZCSG9QMHJ3OEpySHNRTWlzVm0yRXdDc3RVVVVwTm1CUVRDYnNmK1o1di94?=
 =?utf-8?B?VHhEVVNEazE3QnhlK01WUWNKbFJHSExVb3VIMlBaZ2lnMWNDbmZQa3FJSmll?=
 =?utf-8?B?NzNzcG1wTm5MOG9MWFB3Z2JMTUJaVnFnOXlXNFZHQ2gzWHB6Rnl0NmJyR3Nk?=
 =?utf-8?B?TjM2WGd5enZnSUFMRUNHRWUyTDdEbVFOL2xHeUFkT09mWnhPc1BhVjlxcVVD?=
 =?utf-8?B?K0h1VlNYUG1wc2svdk1JUWc2ZVhXcVBBb3NkemQ5REROay9JbGlEUVZ3bkpo?=
 =?utf-8?B?ZCtidWtUb2Z5V0o3ZmZhajY4SVBtUHIwSkxlRWpVUUJvNHhudjZrZDdvblNW?=
 =?utf-8?B?bzJyUWhFS1VuU0xDTzdkMTNZRFl6MnFFQVRQdUZCOFQ5aUlwNEx2VkEzRTF4?=
 =?utf-8?B?TTVkWHpTem02T2FMYkVUeC9MVWJIWEFiTzFKS0RvRlRvR2FZdmdCZGZnVkxy?=
 =?utf-8?B?dHBMTU1QellPdnFlZFEzWVFrR2FPS1dXSWxxNmhQZWxuY25zOVdCbE01aTZQ?=
 =?utf-8?B?K2ZPSkFjWk1QRFQ5RG5aYXY2YUJhVTNZTHI1Qkd3VVJCVlJBZVliaTNTQ0Z4?=
 =?utf-8?B?VXM2M3R6VUt3VDVFU2JnbmE4RW9IWnlOZDMxQklFNWxpZDJXZWpCcDNSRTJJ?=
 =?utf-8?B?cVIyNkZqeFRqa2NOaDJxOGovcVJ1UGp4dlg5L1c4dndaeUJqdmk2Rm9pamlN?=
 =?utf-8?B?bGtRQ0g4bU1jR1N1M0Z5eVVSaUV0dkF0UUFwNUhBU2hNV0hLc1VQRlpKR1Z3?=
 =?utf-8?B?V095S1hHbmo1Nk51cWNDQ0dGbERITXFlTmlKWTdLLzZ5ZnFhM0h4c2N1Z2VT?=
 =?utf-8?B?WEFoZWU2Y1pmTXpTc0p4bjVtTHZHRXVEVnZMajZrTjRrblN6YWFwdTY0UCsy?=
 =?utf-8?B?K1N4K3JaNEJRZW9qSTFVbWZYU3UvQXdXaTVOK2xRRUgvMHBOdHhqdGNENXM0?=
 =?utf-8?B?Q08wUmJ5b280NGNVN2gyVGdxOHZuTVBCV1ZZSG9MVldxSmkyRER5NVpkMm1G?=
 =?utf-8?B?L0o0Q2R2ZlRRZS8vWGlPRURvK0hobzBzbVM3V3NjdktaVHQxOXNBQ2NmRDk0?=
 =?utf-8?B?ZWJLM0JKZDgvdlhTRzZYTHBOVytwS2I5azVFZWVKTFZFZmpSWkJxek9ERXM0?=
 =?utf-8?B?Z21VNFlNSGQyejlVMHJjcWxvVzBad3pnTmZVOThWdEk0cEpRSFRxQ0VnRVI1?=
 =?utf-8?B?cjgrdWg3VXN3N2dXZGVHM0FCU2hWSlk0Mis3dFJOSWF2akZXVExHaGtVVmp5?=
 =?utf-8?B?NmM1eTVpbE5EVzZCdTZHcG40dGZJRmpwa1FBTzluMlloTTA1bUljRkwwSWNw?=
 =?utf-8?B?eHpOa1dZV2pYWkptZ3RzSUZIbG1aODdnanpsWW00VVVHamNWTFNyL3p4YXpY?=
 =?utf-8?B?RThKRm1DRmZDMnZ3YjhLeTRTSjV0ZmtQTlhvTndUSzNoRXcrS2J2aDVUT1ow?=
 =?utf-8?B?RWdKME43NlFuYXQyREZ2OGp6ekhjTTlZWFBITEJXQnk1TjlpcnF0WVZ6dG9Q?=
 =?utf-8?B?aFI3dy8zdG16WGc4NDhkVWVlcTFObiswTWJJL09tcW51TFV0U09aUVR2cEh4?=
 =?utf-8?B?OThDU0xMMm1tSkdCd1J0cGNqUEk1Y0FhZm5zWEtubjVTMEE0WXhDYm5sM3ho?=
 =?utf-8?B?ekFyM1JxWlBLNlFCb09TV2lmWWMwa0ZXTU11TEVHYlBzc1lMSFYyTkZyazZ6?=
 =?utf-8?B?VTVKSy9WeDF5L2tHL0ROaDV3VFpucHNFMG5KVkFud2wzenJlREpZbS9PK0dP?=
 =?utf-8?B?aERKcmMyRmVBc3lHRXVCdjB4ZklvTlJKdVlCcDRzZUVEOU4xMDM5MUYwWjF2?=
 =?utf-8?B?MkFiUDVPVzJnV2FRT0pzS3dwVEtQclc2OFh0MVRWMitsQTJqc0U1N3hZWVFy?=
 =?utf-8?B?SHRSZXZtbEwyQXdHYTZIaXJNMWhmc0hOYlNtWHZaZ1R5Vi9DbCt5ODAyN0J4?=
 =?utf-8?B?WkllNkxId0QwWTUwTHJIT2hObEtYd2ZOcWd2Zy8zR0NkdnZEYmFRUURJOXBl?=
 =?utf-8?Q?AEQ2cnimez0M55j30N1v/Spvr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6031661-e4c1-4593-ea35-08de3c8a811f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 10:04:30.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3D5KxmiWbGnJSAFJ1otsrjXU7c96SUp7h+jbl0jt1ApBhtBdkl46F++1gDEFTqqtrz9I5v4Zrcw/LflS3J92jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011
Message-ID-Hash: Z2UNY34YA2LYQKXLX32J5EXUVODOJ6R4
X-Message-ID-Hash: Z2UNY34YA2LYQKXLX32J5EXUVODOJ6R4
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z2UNY34YA2LYQKXLX32J5EXUVODOJ6R4/>
Archived-At: 
 <https://lore.freedesktop.org/a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/16/25 1:45 AM, Timur Tabi wrote:
> On Mon, 2025-12-15 at 11:40 +0000, Gary Guo wrote:
>>>   
>>> +static mut DEBUGFS_ROOT: Option<Dir> = None;
>>
>> Please don't use `static mut`. If you need anything associcated with the
>> lifetime of the driver, please just put it into the module.
> 
> If I do that, then how do I access it from gsp.rs (the last patch in this series)?

Given that the current PCI .probe() doesn't pass in module data,
I looked around and saw that Binder is using global_lock!()
instead of passing around module data. It seems like this area
is still new in Rust for Linux.

I wonder if global_lock!() is what Gary had in mind? That is still
effectively global access, but at least it's synchronized,
unlike static mut.


thanks,
-- 
John Hubbard

