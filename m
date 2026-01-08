Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A039FD02C39
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 13:55:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B72F10E70A;
	Thu,  8 Jan 2026 12:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="IvQiXKQe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 60F6F44C3F;
	Thu,  8 Jan 2026 12:47:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767876433;
 b=dUS82BzXY8tnY4lPUB1mVUykRq5wEiu9YqnRbiUYpbo8WSyuOa2CC4pvB4xcIQdw3Cs5s
 FEqanfXQi8zxmlzTfgcBBRQoPnZPl27XfAYr8soHz0H2ecEg9AycpLJWFTIn7/3prdn3RwS
 5eQwRFbUPBcoorsbk9dfv7zGlpCTI3BgcMpBcGTidpnqdfGtjzs7MEAW35qQl1aAMB9BaHI
 mT6vybL7JrYxiSOySO5fU4YxbLSHh5pjvEbwbpi+u5mDhrdQ23aPI1CTwlcp3b97nk0eH2m
 bd/yd9MYKlAPm6lV44o/JKmRPz/CvY9gkRPYXspaXT7gc22pGrxUY0SrOkJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767876433; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8YYEBFzPCn1jQcRp8abf9leudzKUSwKc9ASf0yp9xvI=;
 b=MP8gUwaYQFWtL4IhezvdpMviO/m/VMGVWcDl5Fj20ywGeAbI5ydgp+URlFGIDvDWa3ish
 uUU5yCn7KEgDrwxGAMgtrJ7uoM+85jT58w4Chs8N4HWpPMci/PM816DX61dqVknLmOrOkso
 chdzR2fTGF+9jD+2Wsmq+lg1CqznLCiY0x0bVSXMM8XJXGRQidP3fEyTShPhhq3zu5n+vKE
 1Jd4Z5F9Mv1Zz4ReHywfG8nIEp4bpyc5hgbdwDeQXVFhxi70enZcp8Z6uqXZcsm/vsZ0oqj
 Asp0qoGuwKfN5rjF/oa77wmtF5AwYYXbWc0Wxtmj7lPEairMosOldlwfn/Ng==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 155C741ABB
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 12:47:11 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020097.outbound.protection.outlook.com [52.101.196.97])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0F10E704
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 12:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMWRtad9bTfcv1TF1vCfgES/igWeNnzUHy+scQQR2u4AomRnpk8yXw9wJWjkm0p6ra+4CU6ydtXewl3qZtCajUL0+cAF6rTwrnz0SmKpz2sW/wvzM2NA0X3caJeglO/qMs8PPtu01KPBGJOeEsy/xl67vZJlddQN2yERZCn93scCOf+HbCAMpBqSu5jZ1XtQ8wd52yAevlxgYtufymAX9hON7e+6ZD4bXqhQiSNsCy1MibJVtyG8DLeXcojV/3iTYp+w1k2kktGrnMiOnlf4s0F2zSfUOLxA5SpKG5c3lPZj/VJTaX8ChTAIw/xJDLOXgL14DY6oHcn5QE6DJ4qRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YYEBFzPCn1jQcRp8abf9leudzKUSwKc9ASf0yp9xvI=;
 b=JheFvYIk6CaQ2a3gRzDrxPbzimaIOsU402rrLLT8GqSoydIFG6vGUMYpTvMZZLVDoQEV1egSG2VVfTs5wQTA+U5FADDdT4DeE451JrsQ09Jo8aFLZTpGtIjkPJ3CZhq9lh9BZlaPGdBmSnG+n/cU7/sUKMbdqRlR2Z9dLu76yu3VzAn9LTJGmu2M9endxjEAwzg7d0jpP1kEuHBWkpe4zO21Xu10xnAPJYrmnmQVJEOE6If2dcdkzXfh8oeuIGLyoL+l/mUrdnoTNEEIblTH38DAvoRfuaha+oDmdCzcR2PN+Bc+ve2xhG3dVKtMniYN1Z9M2sXb2BF5/BahiXuq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YYEBFzPCn1jQcRp8abf9leudzKUSwKc9ASf0yp9xvI=;
 b=IvQiXKQeCuw35QEDo1KhWfdX6S/nrkQMS+xdkGIcX2S6pDUS4clKFFarIunhFCQOvgCivATSsyP4iMhFYFMdW4Y0ubdKFdjVit+fprjX/8myCLUUD3jvAj9J7CpNjI3Bc8fZTjlMDJmiX1dRsz8qieSXkrx0lRyTuxlKrs3V95s=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3373.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:199::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:55:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:55:24 +0000
Date: Thu, 8 Jan 2026 12:55:23 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several
 print strings
Message-ID: <20260108125523.5c7810ae.gary@garyguo.net>
In-Reply-To: 
 <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
	<20260107012414.2429246-2-ttabi@nvidia.com>
	<1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
	<CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LNXP265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::25) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3373:EE_
X-MS-Office365-Filtering-Correlation-Id: c7269ca6-8029-4d79-795b-08de4eb530b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UExlc3F5NW1jd1YwWndBMit1UzBHWjV2Mkplem1HK3FrRk15TWFPNmRRaEsx?=
 =?utf-8?B?SzRIK1ZxSU5ZZ0ZIK00zeXIxdnNpeWV1MmNZbStUT2krZ3ZDdzM3VXNSWHpO?=
 =?utf-8?B?Q1B0NkpKbW5PUEk4V2x1QXFySTlPVWRyRm5tZUVsSGw1VU51RGtFR3ZHcENV?=
 =?utf-8?B?aXd5OURXRXJibk13RzFkRFJrd0dKZkxGeEdwVkdSZ1Q4b014c1Y3cStuYXFh?=
 =?utf-8?B?ZUhDbVdicjk3eWRkdVUyMzhnUFludzFzY2J5OVo2MHFNdnVoRkFJNGxmT0NM?=
 =?utf-8?B?YmdPREI4dUN5QTRmM054TG5RelB3ODN2U2NtaDVTdFdVRGltdmd1Y3FpREx0?=
 =?utf-8?B?ak5xRi8rcmRJZUpHNkk4c0NBbWE0OXMvdHVhL2tDSER1R0pXRUF5UE41QTN3?=
 =?utf-8?B?bWZ6bytCbE9PUG1JM0pOQkR6b0xUaWZoYVlibWRmaHVhV0VldzR5YVRINHA5?=
 =?utf-8?B?cmhmSnh3K0orWUVVVXFIRE5yTjNXZ1M2NW5ZYmNDS3I2VFRUY01NSUJ3bm9E?=
 =?utf-8?B?Uzh6TklHOXJrL1VRRDR1VkxSTmZkTzY0VU4vdk9OS0o1d0dUd213SDFLcFZV?=
 =?utf-8?B?b0VXaURWaHU4VmVRSTVIUFIvYVNJRTlUSWZucHUzdnNwOWtTWmZjSm5oSUI3?=
 =?utf-8?B?Mkt6NGY2ZVZ5ZTFrQTZmS0FkV0dIREZGZWJHb2pkdHhQU1VPZ25ybWREV1lo?=
 =?utf-8?B?VTVmMEJjS3VGT0IvK0R3cHkvUmFKZ3JYTWNQWDI4NFh3OHBqY0tlby9jVVhE?=
 =?utf-8?B?cTV6emQyTUhiTE01cWRNckwwaUdyNTBEYnkxenV2NElSWTRZRWFZVFdFRndD?=
 =?utf-8?B?Snl2UEtVNUppRHNJR2R1Mk9LQjZybjNlMGhxZDIrRGlQdzlNTTcraFh2emJ1?=
 =?utf-8?B?ejBRT3h0alBIQ2JHNisxbFQzdTBhU0F6RXRVMSthV3BQU0VqOTA4MFhweW5K?=
 =?utf-8?B?UUFVb1o3SU9nTFFZZjdLb3dXdDFubS81UkJCVTVKSnNyNjQvK1RTMFNlVnRX?=
 =?utf-8?B?OENJT3Y2WlFRYnkxTk4wc1VJY3dQeG1IOEhna2ppNDZ1a21lVnZzWGhVSXJE?=
 =?utf-8?B?aUxOa3ZDUEVLQ0dIRkhPRXBXcnF6SUNnc1U2Ui8vSkFhblVUUFNkQmNvZGdW?=
 =?utf-8?B?SlczK045QkpkaUZMVndyOVdOQzB1NnUzdS9lMUc5cC9ObWc2bHJUbm8xU01l?=
 =?utf-8?B?V3BWRVZrZlI0b0hTeDhOZWtPVC8zMHltRlgyMTZUT2ZYcUR4bFhXdVdFK2FP?=
 =?utf-8?B?R0RqQ0lUSzVmdjd4WXUxd2gxNEVFVkt0eWFzT3JkUmtyVUczaU1uT1BuR3hG?=
 =?utf-8?B?elZiVFZSb0szcFk1YWFMTmF0aE5hUlJvU1VZZmVkU0t3N2FGbW5BejVNRnl1?=
 =?utf-8?B?Y2sxM3VBSGtPQXdFOFgwQ3BxbVE2UCtIU1dKOG1QTHhpNlVPUCtNa0RKTGJy?=
 =?utf-8?B?MjNZT1dvdVhZTFVXYlhUSXlsZzJuZVR5UUNEMXllUmQrbEtleS9idG9mZDJX?=
 =?utf-8?B?WnMrMEVhQy9DYU9YUGZxZFRsTFA5YStwV29HejI3ZGZ2VUZqQnNqYUV4MTR6?=
 =?utf-8?B?aXBOTDBjZ1g3RU56eGxOdS9MOGVmeVRMc1R5aDJEQnNKSER1VDRzR1pseEZS?=
 =?utf-8?B?K1pCUkVBbHR3cWpWamRwVDArcXV3c1FHajR6ZDdtY3JzR1BIVjdYdmRweC9w?=
 =?utf-8?B?ZWsrOFFqcFF1cHk1d1RiZEpETGJ2SnBjcEFDaTgzM3JIc3c0OG1aZ0JLcUVR?=
 =?utf-8?B?cGd2UmlaRGxpOGpJRC90WXFZVFQ4dEFuTjY3SU10VEh2dG1BYzFpUDlBaDVK?=
 =?utf-8?B?ZVdFTHBTZGtLd0luUnhtREdQSzJUNzRHb2dLc05TbkRRWllidXJEa1E0SXZJ?=
 =?utf-8?B?L1BDZGpBaU1XYjdURWMwekNkU3NTZWxsV2J1M3JCMFhoVnVJVDNyT04xZVE5?=
 =?utf-8?Q?VHe5wS6S0zXKLikIdeu+C6j7If7CYyBA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXNVM21xN3pxNXhsSUU2ZWMweEpFTmRsTzZLak94RkdodExwN1VXb1VOSUZH?=
 =?utf-8?B?VzVoWXB3cXBmb05HSTBPUlNQcnNKZklDZmhVNjA4OXFiS0dDWVlpSkpDc2JK?=
 =?utf-8?B?TnVyRExRRnZyeFlSRDhMdDNLdUMxWjdJa3pNeStDaUtqSHAzUm9wUzlseEtK?=
 =?utf-8?B?bUdocFBhNGNMdHhiNUt1U2xEdVZvdXJHMUFUOHZ4YnZUVzhjQVRVY0NKV2sv?=
 =?utf-8?B?MDdLQUxvcFgyY1A3OFlwRzBBTUIxb24rSFl0UGEydXB1dG5LN21vUlptZDQ3?=
 =?utf-8?B?Z2hkdDQxckFja1FuVUlLSGc2YUdwQzJ0bTU5MlJPRmt6M1VSa2JWOXZ0WDF5?=
 =?utf-8?B?MlpwdW5mb2IrTXNocW5yUGZETTh2QUV4T2o4NVQ3cVBsc1ZLUTdyQXZRZlBW?=
 =?utf-8?B?VjEyRHIvQmF5SXpUd0hLT2Rwek9hTDE2RFJxSlUxQjkreTFCUFgrWWp2anN2?=
 =?utf-8?B?K3F0THFyY2lEL2FKL20yZVR6YjV0UVVvaU8zTzFTUE1POHhvRVJFdElwL0x5?=
 =?utf-8?B?V0E2cWhaM1MvUzM0ZHp6TXBUbHZlcVU5OTNYUy93YnNBZm5WMEMrY25XRmNk?=
 =?utf-8?B?SjNlQkZPRGtXWXdYVTJGR2VKanF5MWJlUWh0ZTZCRTNGZU5kc0x4M2hyeDlh?=
 =?utf-8?B?b2ZIZyt2TXJKRSs1SWtuUWNsNGl3a0pIRmhGT1RSV1E0bXVET0F2a1Rjc29v?=
 =?utf-8?B?b3cxRXcxT3ZkaGdJaWYxSDNTY01NdmlHQVVKMTZjRlBhMkpsOWxxaHhNUFVn?=
 =?utf-8?B?NFlmQlJvKytVQTZoUjc2UjgwemdTYUx2VkM1MlRPbW5jMzdRTEhpZVR2Vzk0?=
 =?utf-8?B?b0VobDdiZktqWjk0aG41U0cxUndiUjhQWWNrQ3plZ3ZvYlVMUzFnS3l4d0w3?=
 =?utf-8?B?VjJWaWR1L0pYcXN4MUlrYUIwaWlGS0NwRFNyL3dhWVd4R1p6emlZNlg5VFVy?=
 =?utf-8?B?V1Roc3FlVnh1WlJta2xCS2N3b25vZjk5QjFmZEluZUFIS2dNRmg5Ums5V2I5?=
 =?utf-8?B?UGttQnh1WnBhWlFSMkl4SzlaNzY0RzlHUTVsZGdxUWd4UGluNW5sT2h2YnUy?=
 =?utf-8?B?VWZ4RDg4aW0zR29KeW4yRjBxcU5XV20zenh6aU83dUZETUZvVG1jbzNwUmp1?=
 =?utf-8?B?dlpVZVNuUTliU3htVnVBVHpyWEswWTlrMEhoM3FmTTF1RlRhM3VEVEsra3E1?=
 =?utf-8?B?bVVhb000bUZMTmMvNldDWCtYa3BTYnZEdjZ3NWtjN01COXYvTkloUk41OEJT?=
 =?utf-8?B?SmJuK2NwbmtuM09iSHlBeGpwdzRabU14N0dQYzVtOWpNWitsbS96WXhxVE8y?=
 =?utf-8?B?RjFqRjVWamJacTV6R2FwY1I4UHFDV0JYNkZSZW1mZzN3MTU3cVRNVWVIOFAr?=
 =?utf-8?B?eldHN2hlQXVhWTVMMlg0c3kyaXBqbnZEQU1EMHJpZGMxWlJYL2l2SkpNVTQ1?=
 =?utf-8?B?SlQzbC9tUW5IL0NXdHRoZFlES2dXelg2b0VwOWlrc1ArYURERVlSMGg4OWd6?=
 =?utf-8?B?M0hGNHZBSTdPSnIwcW5qeXZaVnZtOCt4SDdkdVZPdzhOT3VvVm9jVk90YzZy?=
 =?utf-8?B?QjNnOStDTlBQMTlOeERHelJqWnQzbUFGUTdTb0FSTU1ZRzNzQ2F3M2pQT3dD?=
 =?utf-8?B?My9BWDF4MWx4K2xReGt0cFJBMTBleVM0L1pXRlU1Y0VBQ0dKQndzUm1wU3RG?=
 =?utf-8?B?aDV4MGtRZWQwclB0UFZiR0JnVjlxVWcvNjFMZTRnYzB5ZnMyK096dzJkbEtS?=
 =?utf-8?B?MmppRlI2OUhFRGZ0bitxYWNVWGRLb1E5NTYrZG9wa2dvTVp4WTFka1JUNGdW?=
 =?utf-8?B?YnpyRHZOQUE2Z1YxR0wxNER4RVpZd0IvZUtxY1VFUEprcEcyUkJUV1EyQjBH?=
 =?utf-8?B?d2prb1lBbjBxUnp6KzZ0RmhINVdNWVJCRWNST0tPUExDbXlQRWVEUjk0Mk15?=
 =?utf-8?B?cE9Mc1M0Z2tscTBSZithZzR6eEg3SGhUbXlDNFlzblFDZjJBVURCVkxEVndE?=
 =?utf-8?B?NnFhMTBaT1VYSFhldmtaZUl2S1NaSk80SnZPaDhyRGE3WHZDQ05wd2dQSWxJ?=
 =?utf-8?B?QmxnSklDL09oL1pWMDZ1WGR1bjUvSU4yeTNoRGlhUFozVzM0YnZkbU8yUVhl?=
 =?utf-8?B?U3AyWUJZWG1mZktOT0FpbXNiSFRoRmFJU20rcitaRU1mTW5TdEs1cDBIak81?=
 =?utf-8?B?QTVQY29iV0NDV2pBTDh6Z2oyWVNoSmhTUUNmR2VTMGdHWEI0amdvbHdIN0Jn?=
 =?utf-8?B?M21haHhEMEV2QStrMnlNMWsyKzBaSDh0U2NqRTJiQnlRZ3p0MzJnT1ZGSDlP?=
 =?utf-8?B?R2tJL04yQkJmdGRWS29CNEJyWkhreXlFMlRNNjVLbXd4Q25pSDUydz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7269ca6-8029-4d79-795b-08de4eb530b2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:55:24.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4l7gJ7lFiRfPKvjfkGINKMBJ/Xw86EK1xyrjVaw3WLvcU1aHmMaBE3VglARHAIywDVyoxcCRipBA6TK5T0vOdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3373
Message-ID-Hash: 3G4FHDIJINVITLUOVLLAR4EVNTT4KRZP
X-Message-ID-Hash: 3G4FHDIJINVITLUOVLLAR4EVNTT4KRZP
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3G4FHDIJINVITLUOVLLAR4EVNTT4KRZP/>
Archived-At: 
 <https://lore.freedesktop.org/20260108125523.5c7810ae.gary@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 7 Jan 2026 10:54:42 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Wed, Jan 7, 2026 at 3:10=E2=80=AFAM John Hubbard <jhubbard@nvidia.com>=
 wrote:
> >
> > So there is not yet a clear convention visible in the code.
> >
> > Miguel, Alice, Gary et al, is there actually a preference already? =20
>=20
> They are supposed to have the `\n`.
>=20
> For a bit of context: when we discussed the printing a long time ago,
> I originally had:
>=20
>     info!("foo");
>=20
> instead of:
>=20
>     pr_info!("foo\n");
>=20
> i.e. both the prefix and the newline were assumed, but we were asked
> to keep it close to the C side, which is fair.

In very early days (before RfL is upstreamed), I had a prototype print
macro that is designed like this:

	info!("foo"); // pr_info("foo\n");
	info!(target: dev, "foo"); // dev_info(dev, "foo\n");
	info!(target: dev, once, "foo"); // dev_info_once(dev, "foo\n");
	info!(target: dev, ratelimited, "foo"); // dev_info_ratelimited(dev, "foo\=
n");

There's a trait that is implemented for anything that can be used as a
printing target.

I still think this is superior than just having our macro mimicking the C
side (and as a result, having a lot of macros rather than just one for
each level).

I think with Rust printing machinary, `pr_cont` is rarely useful, instead
of calling `pr_info` followed by multiple `pr_cont`, you can just have a
custom `Display` implementation and print it in one go. This is also free
from racing against another print and have your lines broken into two
parts.

I would be much in favour of vouching deleteing `pr_cont` entirely from
Rust codebase and always have newlines automatically added.

Best,
Gary






