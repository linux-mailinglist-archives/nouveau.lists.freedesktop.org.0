Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2ACECCDE
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 05:29:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38F10E4DA;
	Thu,  1 Jan 2026 04:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ZUtBDoeY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4465A44C86;
	Thu,  1 Jan 2026 04:21:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767241263;
 b=qnymLeJxYJ2un+O/+8JGHRMxc6RVueogKFN3Zen9iJZgb9UX23V1c74Wpcb5kWsuNfnjg
 RVGCyCnd603CTT9Ee81J3KFVu1WXbjYu4BrYLA24aH+z+AZpd9+BvUauuQbSo8R0Zj9/ehu
 KPreOvPNxg/EhIsuGxrFsgRlvNGqwYFnZEDrq3O2HwrQ1fc8f87xDQpWV/MHW3EVlTId8a7
 CRUib+i8DT8dw0bnTivnNeqB84cYrvZ+3rwH+ip/PgzHVPsunpruhOnXLjoQOI9lR/gQ9tn
 +5Mp16IFpMRrwpjHE7nxaeRxeAdccSGF/Sac+36IQbeqnehk3rNTUQ8NtVfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767241263; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mISEhsCFRczdKiP/biwbn4oYaXaIJOjC1JhSAhXPlHw=;
 b=rMPqKgBDhUVVhpXLouysyDOKDQB0qaHetOPK93zHDeZysOHgNqOuXXwlZYI+jEyLqns0t
 zc8EyCsekeNoI+OYvAQ3fTJfYPDHWzpcjz5I1m7XiVGPVGNfh8+HYsJfMFssgCiiH/YmTFF
 0yCA3X+O9yMUnvINtVM+/WWuZysxrs1erVRRgEqUwtO6Z8P0zkmqRVBB/NQNPxzn/qgXEd9
 MhRvUBHQ2wg94MmOSOik1vUQMt5X11oCwkzOkIzDDg2EDEvRdmwxn89vgMXyMMRvQAW1tcn
 u0itL45ldz7mi5+Uhu5jAU2WzXaCDKMmR9O5UTtugh+WHEDhEjbso1KoMM1g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2548344C5B
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 04:21:00 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020134.outbound.protection.outlook.com [52.101.196.134])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E198410E1CC
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 04:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmZchg3f8se1ZYTehu1tdRVFnx7u2y1GAiw4hxYn3ysr/6luDma63wWG7TF9Q+FzCs2D7g3liZvyXqt0xK2jxBymNTLBCts8XxH2U5wlrQU55OTlcArxYj9KZXUWrZ8Eg4RFG7StylQ27bPhKB4qhkVUmMlkz1sU0NdHrLmViKNx9zc61LiIRo3P3dzjwOvGT3tCVmb0NhOxIPYmp8Nt6ve2eRJe/NAX49uAaO8GjCjmTxYga/0CKvQX6Q9Uo6lM7MfKoEmcQlQMSgcmdLFqwHuDSmWPDqywWKFn0VbQxXT0B4O0CQG7L9XPZyMlyRb17NKqoVCXhaJVBnkT7xvSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mISEhsCFRczdKiP/biwbn4oYaXaIJOjC1JhSAhXPlHw=;
 b=ax+i2y8k43VqguuWAzjsDE4UtDVDzZ5GUFznUvhAOrpLK/BA6Wz98KlZucv47/Jb0ltNp/vFbb0Cax4v5T0ftJ94srWE6d5UbbUH5n9wDpNR6l7siWs2rk4fGlayDAzPSnWrSN1A9q60/d6o1lX/hggMrztDoNfhnF94w0fcfUwna/BNJLNcxfWzlBAqyjo6ygvGV9IS7H2BLuSz6H/9P3vQGv+LGE3BaVcDYGdBRcmqZXWINyoVqL0XfIteHvdYu9jyYT7N5DzmoHjOD56VAL2nNLpBmE3qtFAFVEESA77kxlYIQo3Uy/CkKzDL+SlqEfoOzzFlH1ZPAjk9tEqLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mISEhsCFRczdKiP/biwbn4oYaXaIJOjC1JhSAhXPlHw=;
 b=ZUtBDoeYXCJa1hZS8mxpgqmtI1mxHNJ/KCYFTpRBGlqID0+7+m0smWi4J3OC7g55C4jLEbkqB05NkF+87KSKNCrpeqWDgfhRR6kuaR5QLC5269kSkCopqD/wfycBJRlMp/uQj3CnoF48ci0TGb7egC4s8RHmV7iSFcVdR+6NPo4=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3341.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 04:28:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 04:28:57 +0000
Date: Thu, 1 Jan 2026 04:28:51 +0000
From: Gary Guo <gary@garyguo.net>
To: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Message-ID: <20260101042851.08576bdb.gary@garyguo.net>
In-Reply-To: <4482eb34-0961-4b40-868f-77dc001d98e8@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
	<9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
	<ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
	<CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
	<e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
	<efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com>
	<d1a8fab7-f405-4b4e-84f9-8057c25c5ee3@nvidia.com>
	<4482eb34-0961-4b40-868f-77dc001d98e8@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3341:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b699ab-1dd6-40c4-84c5-08de48ee478e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUcvWGZadE9FUmlacTBERmtxaUFDM1R3bGY2R25SOFlneSs3VXZ3blVQQzhG?=
 =?utf-8?B?cWZGTGtEKzRhUFlUcEZjaFF3cit1YmZsbXg5ZHA4U2tzWUJpSWY1NkVsSE5k?=
 =?utf-8?B?Tk10dkRDQTc1cGpSVVpKejk2K0c4VGRKOFdHZ0k1SWUwOFk0cGtJTldORDI4?=
 =?utf-8?B?eE5abFAyK2srZkJwMCtudzg4ZU1KQkJsNlU2b2s5emdGbU5iR3ZCaUlpcjNp?=
 =?utf-8?B?cDlMZnhkZGZmZGVFaFlDUVQ1SldGQmMzQVZMMWkyblB3ZXBSRERycmp6bU1q?=
 =?utf-8?B?Sk5yOHRrSmJkK0tVOU12cXk0UzdGbUdrTURIUGlKK09xTUJRY1puSEw4TXpu?=
 =?utf-8?B?NWN0UkI1dVdFRUwreStYdEJHVHU4V3ZFYjk0Sm5PcEVvbWdvNExadlBLcSt2?=
 =?utf-8?B?MHgxbFZORVY0N3JoOVFiNTM5ZVNONjRHazRQcTdFdzFxSllXMXdjK2hyRVda?=
 =?utf-8?B?VEExOU9nYUwxNm0zRktlTC9RVWU2TGtNYnZETUttUXlDbGFJdUtpNTl1UWFn?=
 =?utf-8?B?V2JmSzFOM2JpblE3SWh4Y3puT0hjQnpFcldqb2hNV2VCM2VDRkN6TnhxZ3Zm?=
 =?utf-8?B?Y1dhME1tYTJ1clhOaWx4azNVY2I2QlQydk5Hb0I1YnJBZ1VzYjUyTkoyM25I?=
 =?utf-8?B?LzdGcUZ1YWNqTUU0ZklsMVJzTjNHNmwwQTU5c1diM3JVV0U5cGVMQ291SmV2?=
 =?utf-8?B?TGdSRjdsQVNWRzVqb0xWZ3NGRy93Rmp2bTB6K1d3aEppb1JBM3hTY3JjRTQv?=
 =?utf-8?B?MjFPWFJaTWZLNXJYSSs4YUxFbjV6Rk9OT0oyVG1vdWg4cmNzMEszQVhFUEdV?=
 =?utf-8?B?N3B4UWIzVElnWGMwTnd2cGw0TnpvUTdiSjJXRVNaam5Wb2N1SE5GTmJNLzRS?=
 =?utf-8?B?UEdPSnJqUktEUlE0VmE3aW0rNU93YzNtOXJLYWhnYXd0eHg0TlNtVDRabVNx?=
 =?utf-8?B?Ky9GRlFiZFJGNW42MjE5SUw3bnJrcGh4NXRrYWlDUEJtUng4WGtVVVowbmRw?=
 =?utf-8?B?WE01aEo0NHhrVTUrTFZEZWxMcXU0VHEwUXhjb1Z3S3VlSC9qdnZJL0V4SkF4?=
 =?utf-8?B?Tm5GYW9Rbk8wQW1EaTU4aS8weFhlc2dUNGdmUkZuVGhQZzJubXF3eVl0RFk4?=
 =?utf-8?B?Skwvb3hLam5KTW9UaksvM3FLcUV2Qjd6cWJTSVRWcWI4RjhCSHZhQ0tBZHZV?=
 =?utf-8?B?WUhLYkxNNGNrMFNPczlObUdINzUyZU1SL3ByYk01RWdpcVFKN293ZzNoeWp2?=
 =?utf-8?B?anZoSUpaRDF5QjREV01iUGVmdVBrOEJmY2IwYXBycTl3TW9RdVN4NHkwSG1B?=
 =?utf-8?B?NGwrSUdKL3BCdkR5VnF3R05MYXdUUUNFU3NHSVV4cWVjTXd2dzk4QzFWTGV4?=
 =?utf-8?B?KzVrMGdYK3B4SVQ1ZTlUTFg4aFRSTVh6Tmd3dVgzcEF4NWRkNFc2K2x4SkQx?=
 =?utf-8?B?c29HOEpJTUFmVnNYTzN3OGtTTFhXOEN5MkxhSE0wQjZ2a0dPTmtVVk9TOGtZ?=
 =?utf-8?B?Lzl3eVlnQ09MTnIvMmpXMVJTN1l4eExvU2tzeHdXM3lMdWVZY0VwaTlKVGFW?=
 =?utf-8?B?QTJMdjZ0a1NpTDRoVjVvaHpaL1hGTUNWUVREczdlVXhpQlFpTU9PVjJ2dko3?=
 =?utf-8?B?VTdIWnVRMERXbmNHMDRhQUl0OTUrSldJc3ZrallIUE52dXcwakJMVk1sc1Iy?=
 =?utf-8?B?Nk5sSkpDZHRWamg1ak1LbEhyK1JWSWpWU0FzQkkwOWZMenVEWGFGc0E2QUhF?=
 =?utf-8?B?NHNTWFIxbXJVQVVuTHZncEtYa25oRldOaTRVbkc0OTBPZGlSWElSUU4yZ2VE?=
 =?utf-8?B?aEQ2QkgvZ1JFWFZDL3dHSG0yTVYxMDFIVHZnYitzRnJrQUdSWDVQVjFiOG9J?=
 =?utf-8?B?WXlUcDh4cWdIcnhLYkhDMjI2eStBSVQ1d2QvNGlkVjVBekNPYkl6MndmNnBh?=
 =?utf-8?Q?sO1xZSnGrsT2IihtSzvA0uAl/OKSxNS2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0YvdTZoR2pSanhwKzdWVW44WTJYOTJCSHA4MjJpNnhheEJpQ1BaVnlPcG5C?=
 =?utf-8?B?aGpkcnU1ajlMR2ZsVkJmeU50RUJCQXdjN2J1eTF6UzZRc3dCYVA5YVNGbjF3?=
 =?utf-8?B?RzF6M3lrbS93QzNaSHlwWnNuMkozM29NOXU2Q0g5MVY5YVlsdDlLZ3Rvajdx?=
 =?utf-8?B?eUxLdk96eHpKY1U4RFlESzNzNVp5WGo0ZFI2d2gwc0VUN2JnMmRiRXdIbHFp?=
 =?utf-8?B?M29Kd21NT2NjWlZKY3BsVDRzVXZRKzdUczA1NlNQbUZ3QTN6UFlnRENiNVhK?=
 =?utf-8?B?QStZZmI1SlNjMDlmaml2SEZoY3R2QjI3bFU4NEpDRWlkZkFYMjNham01OEhU?=
 =?utf-8?B?amxwb1d1bTRQcUJhRGlHVHNqK1IyMUF5Q3NtTVhFMW82TlVIYWZzN3FBTlkv?=
 =?utf-8?B?L280VHFnSzdYWHNJYkdLZGZSeEtCcnJmMSt5MFNBVnQ4cDVUb0o2cnAzaVd1?=
 =?utf-8?B?ZUx2Mlk3S1R3MEZRN3lNZzA4a2xFK1dIRytSN1RTYW5pTERleGdxWmc1NVlK?=
 =?utf-8?B?bXkyZ1JJaU1YV0s4cGN2QjB5UUpOQmtJUFMybFBxdDl6eDN6MW9LVFlpK1BD?=
 =?utf-8?B?M3NWRHJ2VTdGbHQ0NkFlbVdLc2pXRVA2U2Z6cnFrNlF2NkkxL3ozaExWdUdB?=
 =?utf-8?B?VVZBWnJUekZ5Zzd3b2tTN2NoY29XQmRyd3ptUTVCcmNhdG9vMy95c2ZaOEVB?=
 =?utf-8?B?ZGJGNStpaUdvdzJSa0dleXBsQXVtZW44Q2grVC9jTzFpS2JQMmJrcXYzeW9V?=
 =?utf-8?B?RUFqUCtTYzhkRkJxcURjWVZWS1Q4bVRUSE5lZkF0TjBxblVYd2tZdURYUTlr?=
 =?utf-8?B?bCttZlJUS3VaeGpFRDVDUm9TeWdkeGdJOVhuY1NYTWxvdjljb1EyUWNqSWtC?=
 =?utf-8?B?Z1FwWmtBU2Yvc1JLcVFyS0JNUlFaQ0cwaHdoZEhrS0FhMVBkZ3ZPNnF5ZGNV?=
 =?utf-8?B?Zk9jaHArSXRuN0VTNUVpclBPTXpmTnNGWGl1U2hHZjNwejNGN2FLUndWQXVm?=
 =?utf-8?B?aEJlc2IzWndYaWFGUFM4d0E5OFdhL1RxMGdRbG1SdXEvT21WNWtGd2tRR2ZH?=
 =?utf-8?B?TVpRWXE2WTMrRVM5RVRlRXdvR1AxV3UvNVhIRTBYMmFXK29Cd0g4SWZ4TzEv?=
 =?utf-8?B?Q3NLT3ZvVXdZWitDbFFuN2VBMzI4RENES0ZxRFNmSkZJanB5d3F5eGJ1N3BT?=
 =?utf-8?B?SVRUMWxaMkQyZXNaZGdqQ25oaGY3VXJnOE05NlppbHFNZWpyaXRVaFp4SC9s?=
 =?utf-8?B?N1gzZG1DMDV1amVLTG9NRnRSWjhpTmdzeWxCZFN4YzJsUmxwbzgxN2N1UUti?=
 =?utf-8?B?MFp5Vlk4a2FsdnNFVUtFTEJTZEUzV0VtdDJEQjEwYXlITmdTUWhIeGZJVVQv?=
 =?utf-8?B?SVR3NzMycEI0UDhTbDdmQm41LzYvSEEwRm9aY0RBeGozNm9NTGU0VmsyZHlu?=
 =?utf-8?B?UW84NHRmQWN2NWNZMENMSmREZ3AxZ3JyblNZTlc5cjZSN000TFd2eTNaUUtP?=
 =?utf-8?B?NUpPeDVDWGxBSmE0NVUrM0E5N0t2L1h1dk1Gd1R1YUVjUFFlRXpXeTQrb255?=
 =?utf-8?B?M2Nua0RXSmlqUkdtRW92dGkxTEFuUisrSUdTc25RdWJkNUEzcEk0TGVxYnh3?=
 =?utf-8?B?Z0poblY4SU9rZVp1RVBNTUtxbmFvNU05THdlRUlkUlZETEJhdkxqKzAxdy9a?=
 =?utf-8?B?c1BvdG1naG1ERFJ4bTJEenhuS25tNk9RQm5oYk40SmFQWEdlNUJNNnRXdFVv?=
 =?utf-8?B?T3BQQWRiY3lNTXI5SVNDeXBMZ053QmVwQzVqVmlDUUUxaWcydUdtN3hHbnlr?=
 =?utf-8?B?TTBMMG1IaXhZWWtUcCtEeWZHUEt1NldmWVNxM2wvS0dhSjB4ejkzV2ZzUmhK?=
 =?utf-8?B?aVl1VE10b1ZoVjB2L1BGNWJ6MmRkNlRvcExkR0E2ZG14dTR4MFRUa09aYXRI?=
 =?utf-8?B?dlZiazZWWmFLeEVORlFvbm8zRXhsZERnbDJ0QUwyclY1NTErOEZBNHloVDQz?=
 =?utf-8?B?UU5Zd1duSVJ2VE16UEVLY3hUL0FsWG4rZ0F6cERPKzE5endtQnIxYUlPZFZv?=
 =?utf-8?B?OVFNWGNEV3NiTEZ6aFZSSkJlYkY2UDhMNEd2NXQ1UVVlS3lEUkNiekFuQlRH?=
 =?utf-8?B?Q0hUWXJwbWpUNzJMa0FTU2RLbkluUUJaN0R4K3o5UCtHczZuNjc5U3JyL2xN?=
 =?utf-8?B?SHU3M3VWcVhhZE5KUEpxNWtGRGhTVTQ3dUNRU0dCY2FFN2hVWHB3UU5McU42?=
 =?utf-8?B?czJIZ05tNHNWSCtSaUg4NlU4eWhFdGlBdlJRNVl3NFkrK1dNT0VGVVhPcW4y?=
 =?utf-8?B?bHVzOFd4THVDL0lMVjZTaUtxYStZeS9CY01iaDZOejdsMTdjZjJjZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3b699ab-1dd6-40c4-84c5-08de48ee478e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 04:28:57.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t5YrjUcNSCxINZnLLROZ1/ygdIIU+ecWmX8AdTqNqo8HdbQT60K+P7BWxmgxteOewkVGl0Rztke9lomW20meFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3341
Message-ID-Hash: 4GG3UWJYVU5R5QG4GZN75U6OZSEEXN5S
X-Message-ID-Hash: 4GG3UWJYVU5R5QG4GZN75U6OZSEEXN5S
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "dakr@kernel.org" <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4GG3UWJYVU5R5QG4GZN75U6OZSEEXN5S/>
Archived-At: 
 <https://lore.freedesktop.org/20260101042851.08576bdb.gary@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 31 Dec 2025 23:05:21 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Hi John,
>=20
> On 12/31/2025 9:52 PM, John Hubbard wrote:
> [..]
> >>> But this really is fake chaining, because there are no Results involv=
ed.
> >>> It's not buying us anything except a bit of indirection and cognitive
> >>> load for the reader. =20
> >>
> >> Chaining is not really only about error propagation. Builder pattern c=
an be used
> >> for other cases too, like passing a setter chained expression to a fun=
ction
> >> argument for better clarity, I was planning to do that for the sequenc=
er for
> >> instance since there's a lot of parameters passed to it. =20
> >=20
> > Let's see if that has any use for this.
> >=20
> > So far, though, in the code base that we have today, there is absolutel=
y
> > zero benefit. The diffs here prove it.
> >  =20
>=20
> From your patch diff, I see the lines of code increased. But that's not e=
ven the
> main issue I have with it (though IMO the chaining is more readable..).
>=20
> >> But in this case, I am actually absolutely opposed against this, it ma=
kes the
> >> API hard to use because now how do you differentiate between an IO fun=
ction call
> >> versus something that just mutates memory? Is set() an IO or write()? =
=20
> >=20
> > That's a completely separate, pre-existing issue with the API. =20
>=20
> Nope. With chaining we clearly know that the final operation is a write()=
.
>=20
> For instance, you cannot do:
>   reg.set_foo()
>      .write()
>      .set_bar()
>=20
> That wont compile. You cannot intermingle write() with set_XX() because w=
rite()
> doesn't return anything that can be chained with. The builder pattern is =
typically:
>   obj.set_something()
>      .set_something()
>      .do_some_action()
>=20
> The 'set' can also be 'with' from what I've seen, whatever. The point is =
the
> last thing is the action. IMO very readable and simple. I know that the w=
rite()
> will be what ends up doing the I/O. It is one entity that culminates in t=
he write().
>=20
> >  =20
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.set_foo(x);=C2=A0=C2=A0 // no IO
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.set_sec(y);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.write(bar);=C2=A0=C2=A0 // IO.
> >>
> >> So no thank you, I quite dislike it. :)
> >>
> >> Instead with chaining, we can just rely on the last part of the chain =
concluding
> >> in a write() with the intermediaries just mutating memory. =20
> >=20
> > Same as above, just a more happy-happy chaining interface, but the same
> > function calls must be made in the same order. =20
>=20
> No, you cannot place write() anywhere except at the end of the chain - th=
e type
> system enforces this since write() returns ().

One thing that probably should be added though is `#[must_use]`
annotations on these set functions; this would ensure that if someone
writes

	reg.set_foo();

the compiler would complain that the return value is not used.

Best,
Gary


