Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EC9CF6776
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 03:29:43 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72C4610E16C;
	Tue,  6 Jan 2026 02:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QToTr8kx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3400E44C98;
	Tue,  6 Jan 2026 02:21:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767666089;
 b=kY3KIf0Lr13B9KdkMxQxSyJQVsf6VMXBpHyCgMJgDfgv2hGu2XNBLK4LKPM+kgIYtPaOg
 uIpmRuHhIfgquXi7qWHDpDe2KfYf9BWXIgQMAKkWxStKk8Mmb4tLKqtPSSNJr0zZvIHe1Z5
 vT5MRceIbhTZj+m/w/Z/6ym/bLii+h1DfLyTqdgAD4DFcIIx3uRXRd7B6oFjfZAUH3mFI8o
 cH4TefAbB0phs0YDYUd10gPOMHTwDjzvo9Er/hTnrMBtbgg45ZPAhM0yRVSjcGadZ82Y2dn
 InyMeEqnZaF0DZ6mkxBDGjDKhH/xCf1Tk/i/LWvkbojMS6qrqPOH8ggYhxmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767666089; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=myuE3zTI7qflLob/dXs8nAL2PTXHA78y5czJHM2VVQI=;
 b=FAPDokUWp5a5vutbPoaa4YiyhRs/ac9xINATw1X3TovCgZ5WqXP751+miOBy7dw7Mspfu
 Ecn0kkWIRUdXL63+87Kk6f7VsCm2ccPdiMhQDk9nBB0tOfsHXxkUYlu8Bx0cKhNP1MUI/l+
 u7cclRW09r+QhT5M2z1qBnfe4Wkkg+69WJFNaXYQ3/RuY8RPCDguftgWYIVEd39OlaWUUn+
 Kx8vVHC3pA7liL/uq7V4gi1Hj4Aj2pMaBOuvjEOBoskr7c5QodeI2beLPv4f2gcpihTorAv
 J2Av0hoUhr0+UYEHeRXBWEzbw+/FsQtiNgUBD5XnQxQJRiTlNlqgsVvec19w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 95DEB44C81
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 02:21:25 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8105310E050
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 02:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHqZVPsK6A696t8PvUT0RXUDM5E6avj1PiQ56lkHKA3h+MngIsNbpJ9+VX+V+RSE0U9px/Y4EqmAl2ZFL/RvkWVxkCxKKTHLGFOAk34FY1Qt4FtQL5NceheRi+Tc2UufU51cw2GFZmvlmlKFEkBxCuLCtNVdu6VpTOJkbCrCrDT4P3ZLl/U1RBmjyiRur4W3TKN5Itb1S0IkZyNhgCGAJrWo4FynYfY0x1iw4a5qjSp048t4z4oSiSL9baVXn/vDLGSYa3dOhANOraPOu4HGnFZe76xjOAaJKDg6sZu+v2fO5ytD7xqpsiQz89QKgI8vcsBrvzZ653JapEzwyx7SUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myuE3zTI7qflLob/dXs8nAL2PTXHA78y5czJHM2VVQI=;
 b=X1xQiOiDwHoJzuNDUx4bSCjpFi0KH6emJnTbnKwDyuV5hhPvZHzy6wN7RWrmuue15Db36QbWP/P1DsxAcq6nBx/5xJouE9GMUVxCz7msp07YJ5crZr4c2MZROMYD9wcJaKfqpjGc7rNT5fupRlWrMfilsYfGLnQA43yD5xVQ04bUPMP6P4SvqSmfMrwwTEAU3rolYrGFla9cVlMsPjK/IIS1+QfKIWyiobQlS2PeMXuD150krs4dWsOPeWsJVe/RnrpntnG79x90RuQCFE0871WxggvqLBf0XwOAVZEv/qsnE5qCYaCIGI4KsKXNEyaD4mbhzTjBYtew58Qc5YbIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myuE3zTI7qflLob/dXs8nAL2PTXHA78y5czJHM2VVQI=;
 b=QToTr8kxG1Cn/IUZy3uwe1hZT5WcrsWctFYUD8VRXC5g2cO3d2PX/wTNzrMyfVAoJFgdpYa6irFSIjdCmx241Rr/Gxe+Mtsc7l3UiRosZWSFhcwBX6FaxRd09y91g9Bo6nGczgfylSVl4avNbHpi7gHdMtMM9JLKG/FyIgB728hIcI7zEIFUhL+HJaEU93hf1c7Y0it5kB3C2W6NUD4Xe0XoxZ8FJuZkO3k0KOwdfs/LUUfzA64kIGF2sgygPPkHzTqQjlw6k2oFLUN/ad7NgpzrqCc/t9lR7wk137Mj82tNPRGkTOjJcC9Fb6UI6M8gmJa7TCk59jzE40XOmPkZVw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 02:29:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 02:29:31 +0000
Message-ID: <ff80714c-cb9f-417f-8d3b-13c41826134e@nvidia.com>
Date: Mon, 5 Jan 2026 18:29:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <4b589c75-c6d1-4733-80b1-a9a454445fb9@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4b589c75-c6d1-4733-80b1-a9a454445fb9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4d0493-2aee-45d5-b070-08de4ccb6c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ry8rQ2d2KysrNHFVNkFsYWdVQVZZR3YyTXdnd3dURWl2TzZhVVdIRVVhSHpH?=
 =?utf-8?B?d2pKbjN6ZVR0dlNnWks5TEJId3RGUGlZZnQ4c0tDSFRxNjBMWnNFQUx0TFgw?=
 =?utf-8?B?eEF0QXlWa0tqc2JXOVc3YjdTb09KZitEenAwUTJrL21SbGFPb3pKMWhESnoy?=
 =?utf-8?B?dWM0WEhCdXpSVkFuV1dQR2k3NGFjNllUbFN3c2hPN1RzNy9RT1V3VjhZelp1?=
 =?utf-8?B?MkZ0bHhDYm1LNk5UV0VoaDR3ejNITGlQdFVwcTBjMDQwcHlNSGhzY1NlSzJH?=
 =?utf-8?B?UGtscUJTdDl0MVoyNXlJTXRYcmQ4OEplM2Q4R0NOUDBGTysvZ3dPczRLajVD?=
 =?utf-8?B?WDI5RVo5UjQrMEl5blNJVjlOb2JKSW1EcWFQanFRelZ5c3ZuV0ZSWTFOczcv?=
 =?utf-8?B?MGZZK3BmOTZpdGxJaEJZOGRUTG1kbVhZRkFUMDVqOUxjd1VoeDUxNDExai9w?=
 =?utf-8?B?cVNDcXF4STU0bTlWdHlXZ0ZWbWVMRmpSdExQRFkrZ3JwaklML2pTN2JVcm9p?=
 =?utf-8?B?QVBBOTI4eGxyUUF5Tkl4R3dBdVEvNlpuMVdKQ1NUTDZZT2ZPMWF5N0g2eTg3?=
 =?utf-8?B?d0tUWlRXRHBmQ3V1S0RwTnIzYlJJTEsrVkRFUUFRV2hmdlBObUZDajd0Z0ti?=
 =?utf-8?B?NkV3Y1ZGajdhT3UwdjVNeTc0STFBVHYzSGN3NitsZEwzbGJwMm9wclFjQUVM?=
 =?utf-8?B?UzJRMzJWaGZRc3RSK0ZYYVBQc3AyUFZadEdGMWpYczJQWHdkM1BVcW5HS0d6?=
 =?utf-8?B?aW1BUXdEZEJHdmRLN1ZsOE54UTJ3OHo3a2ZqSEd6Umt2OHBLT2MrQ1ZUMkly?=
 =?utf-8?B?aXQxREdaWVVId2ZRdHVzaVBvajdSdUY2U21SL1VBU0xLUzRiY1NjRWErQ3F3?=
 =?utf-8?B?SDV3Qlljc01HNXUyR3ZxWnBlTnh0dGVXdk9CTmYvMUpKUm01RHV4VVRUbG9v?=
 =?utf-8?B?S3Y3Z0FIQnN3OHRNV1RRNnBIR0F1UXVHOWZyVkFuR1dwY1plazFDTTdNVjND?=
 =?utf-8?B?UFV3SW9TOC9oalY1NElVWnhva0NZMDFva3lGWmdhc3BxUGF4MEhXYS83T3FZ?=
 =?utf-8?B?SnMydml6Q3FLYk9IeDV0UjlMYy8wMUtQYUhGY0RvVzFEK1h5WlhvMlNQbnB5?=
 =?utf-8?B?M1NzWDhRMEM1WVJSMEJnR3htUzNmMDdKNnMvUERTSFBxUXdLN0NjVEU2WTdm?=
 =?utf-8?B?OFd0QkVpQXh2eDZHZGpDSU9VN0lCNlErV0N0QkJVQjBxZXlCUUFwNGN3ZFFJ?=
 =?utf-8?B?QlNqSm1QUzNYOXZzaUVCRjhQcURTcXNSTHV3d05ZU3p3SHc0aDFVMUdLNzAw?=
 =?utf-8?B?M3ptSnBUb2VQM3JqT25IWGhQTWV1cEZ4V0owWFhFMWtNNHllcEMva2J0dHVQ?=
 =?utf-8?B?TTJLaUxUYmpPYUxFMHJ0NGtUQVJFQUdVcFRScVpoNnhEaGJhOW5uUExzR29s?=
 =?utf-8?B?RDZxd1RaR1dpNUR4aU5UY1NtaTBCMUZQVWpmYkZRbWtUWDNnY2hoZGFta1Fi?=
 =?utf-8?B?aHBsSUVxckpXVy94aDhzSnp5TEhHOHJxOUM4NXZHR2o4YkErYUs2YmhaVWxC?=
 =?utf-8?B?L1J0VXM4dXBJMXBjYk4vZk9hcGVrYldCcWNDcGVuNTJsMTM5N2xBRUVUVGN6?=
 =?utf-8?B?cXJvTnE0eGVRanVLL0xMTGg4ZzhGQTB3czFvNkk2L0dmYng0WVhQRjJKSnBJ?=
 =?utf-8?B?aXp5K0FjbVFzaThEUXgyRXYyYUpRd1dDb2YyTjBuWmtRYmZEUmJHd1NDYm9N?=
 =?utf-8?B?VTZrTXpQNER5bnVsTEszbnBVYkpFeDZic1RYbFl1NitFcSt1bEZVdVpBVVVF?=
 =?utf-8?B?WE1zRWpYUE5PWDg0VHlNc3BONGdqS29PSy9HOEhlSU9pZWxmczUzU1dDeU9O?=
 =?utf-8?B?aTZPa2lZU3FIeEc4bFNwMmlMNFdZSUU2YVpPUWZOd1dWNGNjSVB3Y3JyUmNP?=
 =?utf-8?Q?c/Qrq2smq6JjiXiHfFFmJU0E0yPDjU+s?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzNlcitqU242K0UvVkd3ckhFUDY3R0lWbjFIWTJyby9kYjE0VFpMenA4UkZm?=
 =?utf-8?B?R0d6QjBkM3E4Q0RqWXpYZ0ZldVl4UlZ5c3o0RW9od2MzUVo0UHlIcDJ3SHFO?=
 =?utf-8?B?bEpyYThIZytGaTMyRWRzb2loSnBXSTFjLzNLZjB0SlhnTk0vZWg2RFhOL21n?=
 =?utf-8?B?T0duWGo4RHFpa1pZQmFESnZycHlKMGpjamh6QnBFRW85d0lRa0sxc25Oc2Mz?=
 =?utf-8?B?ZXJZN0ZBcVFQSGRYZlVRREFKNkpaTWdWUXl2WDZWd21CU2l5WmY0M1VkcXZ5?=
 =?utf-8?B?WGFuMmFGZFozdHFQQzFpeU9sTSt6YW9JSEpxT2R6c2xmNXNYMEpOS3g1RzQ0?=
 =?utf-8?B?Vnp0QmQxdzdaSnV0bHI4SEs5Sk1DZC9KZ2gzUGRNUnhmczl6Ni9tSnlMZEhC?=
 =?utf-8?B?RVV5Y2hiSHR1QktZcG9OOWpER2habGdYMXUxaVJaWkdEVUJ1R2FvQXR4MlJZ?=
 =?utf-8?B?RU5ZOHlETllTNGlueWVZcEUxeE1HZGJEY1ZVYlQwY1VRY0E4ZTNUeHhZMHA5?=
 =?utf-8?B?YkR1REgramlRdjVnbHlHR0VZaUhaQ05FMm42WHNVTjNWQW16RG0zWVhjaUIv?=
 =?utf-8?B?dGhuYUJWQnAxYm50bXAxemZ3ampGeFEvNGNuTExhSzRMTnhMWHpUYmlhelFV?=
 =?utf-8?B?QVRCTDJ1bUl2STZCMExNQlFMSHRrZmh6UUJRVUFjRzdrdkQrM3NaNHhNY0pZ?=
 =?utf-8?B?ZG9wVi9vSGNNR21LL2lNeFRjWGhsWFBYUmo3dDlkVmRpWldNR1kxNzVFVWRh?=
 =?utf-8?B?c3lubVVheWUvamJyRjVvTFZVakowUTVsNzRwMkpXSXFwaUR4RXhCdzJVYnJT?=
 =?utf-8?B?VzU1VTlWVnVCK285Y3pOTTVVYlRuMjdtcW9MU0JJRXZrb2t3bStUTk9pZUNu?=
 =?utf-8?B?SXhPdGtHcXlqYXFnY291Zm82WDU2V3M5NGxzcHdLUnJZa1lKRkxDSlpveFQ1?=
 =?utf-8?B?bDh3TTB0T2ltanBtcmhLUUt4M212WHhqR0FNUVhzbUtUdEZYY1F6SVNGT1Zl?=
 =?utf-8?B?VW54SEdBdWl4Vkc3c3VKM1kwTjF5RkZ3d3BocE52TVJqdFc2OWRYWE5mb3Ji?=
 =?utf-8?B?SzhOU01KTHBMNERkdlVpbisrYXJlbWRCTnl2NC9wVkxVTWk1SFBZbVlsWDNy?=
 =?utf-8?B?c3hlYTNvUUZqQ2dGNjQ4Q1FMWmdldHRPTUJPSmZGUkJRanBtZFM5R1llUkVP?=
 =?utf-8?B?b2UyUHZCNHlzVWdxODZId2VmaGhxZ0tZcmw0WnBsUUlyek11QlRMWmU3TUFq?=
 =?utf-8?B?dkdNUGhnKzJTOFFUWmdYMmVwK3RzQ1FYL2pKbFhyOVkxYXZHYUVhaFlzRHVK?=
 =?utf-8?B?QkxPVEFlbnE2OHNvKzljanVBN3BWR3RNOVd6QVloYnBIVG5pakQ5cXRXQkxC?=
 =?utf-8?B?TWc1Y0h1TlhRbVpyZkVxRVpvdWtaRFI4Nnd4cnlVMWRLeWVoU0hVbXZDYmps?=
 =?utf-8?B?T09aT0ZFSG9PM2Q4YTFPeXhUSXhvY1JhOWJRaGlzREg4SlBQbFU2Sy9WQUd5?=
 =?utf-8?B?MWQ1d2ErZDNJWktvNHZZRzZuTFNkUGU2dlMrdW1ITDl0ZXdlb1VYY1I1VjVn?=
 =?utf-8?B?bkxvZnUvbXd0Wm1HaE51WWszVTl6ZFRZSkhVYytIWW5GejUvV0xnbFlDN2hJ?=
 =?utf-8?B?ZVBqd2FBWXhPRjVBWlF6czV3YlF6VDdVVFlGcjNUMmRZaHVZb1pEZW9Sc3RC?=
 =?utf-8?B?L0svT2tWUEU5RE9RT0MrNWJjQlFZakxDQzlrd1I2czVZQnFUai82ZVdPejlm?=
 =?utf-8?B?NWl1eitNRkRCWldTZStGckYvNFdjMUJQS3JlWFJuejlUNnlLVDZHakp4SDRa?=
 =?utf-8?B?S0t0YUtkdmg3S3BlaGw4bzZTMHh0UVZ2aEZQVE0yVUswTFN4RkZYaEdXQjVK?=
 =?utf-8?B?Z2VXK1NMUHk4ajB6dmRHbk53cS9qMzNHdmJ6NitOVktMdXJOcFc5NnJLVnJ6?=
 =?utf-8?B?N1YzUzI3RVc5OTVlTU1nMnJaaTErcmdNNjBFcTZQMDM2QjdSSjBIRXBNSk5w?=
 =?utf-8?B?b0lScllNbU5vYTJkRUxnSE1QSFR6ZFV6QVpnZFhicUQ3WGpiWGhML21KSGdP?=
 =?utf-8?B?VTBHeHhYbkRWdVFOUkFDSldwVjd6NnZDYTRHZlVBbHJmb0lRaWRVaWtCOEZE?=
 =?utf-8?B?QXRydGR6OTZVNFdCTGZYb1AxdWZJNWg2RzVVZVVwTDllZkVZd2Urd0tsZEx2?=
 =?utf-8?B?YUNpSHJ6VWtaMTlZVHBIY3hHdFdNOURWbW82L21Yb0JXZHJJVTR2OWdXVFFn?=
 =?utf-8?B?NDdndlZqRTh3SVZIdlpzd01IT290SURoeW93M1dLU2UxTG1pZDhJVkhNU2RN?=
 =?utf-8?B?TVhtdDVFeVcwWVJEb2RvT1ZTVm1lYUI5bWcxTWlqdm5pcEhCV0JHZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e4d0493-2aee-45d5-b070-08de4ccb6c1a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:29:31.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RK6qu17tALxK4opxp3Yn/e+TNd1MS5B2qqcm4EDd0oZqAXzWmniVkuhtvOIdk7rnBQdDA4mjQOz+R0Y8zNOMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183
Message-ID-Hash: ZMKGNJE6XTQSAVASOFGXBWZ5MOQXCBPH
X-Message-ID-Hash: ZMKGNJE6XTQSAVASOFGXBWZ5MOQXCBPH
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZMKGNJE6XTQSAVASOFGXBWZ5MOQXCBPH/>
Archived-At: 
 <https://lore.freedesktop.org/ff80714c-cb9f-417f-8d3b-13c41826134e@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/3/26 1:21 PM, Joel Fernandes wrote:
> 
> 
> On 1/2/2026 8:34 PM, John Hubbard wrote:
>> The util.rs module contained a single helper function,
>> str_from_null_terminated(), which duplicated functionality that is now
>> available in core::ffi::CStr.
>>
>> Specifically, CStr::from_bytes_until_nul() is available in the kernel's
>> minimum supported Rust version (1.78.0), so it time to stop using this
>> custom workaround.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks for the review!

> 
> Probably elf64_section() should also use CStr::from_bytes_until_nul() in gsp.rs?
> 
> Right now it does:
>          elf.get(name_idx..)
>              .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
>              .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
> 

Yes, absolutely! Thanks for spotting that. I'll re-send this out as
a two-patch series that includes that change too.


thanks,
-- 
John Hubbard

> 
>> ---
>>  drivers/gpu/nova-core/gsp/commands.rs |  5 +++--
>>  drivers/gpu/nova-core/nova_core.rs    |  1 -
>>  drivers/gpu/nova-core/util.rs         | 16 ----------------
>>  3 files changed, 3 insertions(+), 19 deletions(-)
>>  delete mode 100644 drivers/gpu/nova-core/util.rs
>>
>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
>> index 0425c65b5d6f..a11fe6018091 100644
>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>> @@ -30,7 +30,6 @@
>>          },
>>      },
>>      sbuffer::SBufferIter,
>> -    util,
>>  };
>>  
>>  /// The `GspSetSystemInfo` command.
>> @@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
>>      /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
>>      /// invalid.
>>      pub(crate) fn gpu_name(&self) -> Option<&str> {
>> -        util::str_from_null_terminated(&self.gpu_name)
>> +        CStr::from_bytes_until_nul(&self.gpu_name)
>> +            .ok()
>> +            .and_then(|cstr| cstr.to_str().ok())
>>      }
>>  }
>>  
>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
>> index b98a1c03f13d..c1121e7c64c5 100644
>> --- a/drivers/gpu/nova-core/nova_core.rs
>> +++ b/drivers/gpu/nova-core/nova_core.rs
>> @@ -16,7 +16,6 @@
>>  mod num;
>>  mod regs;
>>  mod sbuffer;
>> -mod util;
>>  mod vbios;
>>  
>>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
>> deleted file mode 100644
>> index 4b503249a3ef..000000000000
>> --- a/drivers/gpu/nova-core/util.rs
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0
>> -
>> -/// Converts a null-terminated byte slice to a string, or `None` if the array does not
>> -/// contains any null byte or contains invalid characters.
>> -///
>> -/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
>> -/// slice, and not only in the last position.
>> -pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
>> -    use kernel::str::CStr;
>> -
>> -    bytes
>> -        .iter()
>> -        .position(|&b| b == 0)
>> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
>> -        .and_then(|cstr| cstr.to_str().ok())
>> -}
>>
>> base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
> 


