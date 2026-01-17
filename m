Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA7D38B61
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 02:56:28 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D80D10E124;
	Sat, 17 Jan 2026 01:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zjb4M4yx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7AE7144CB4;
	Sat, 17 Jan 2026 01:47:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768614469;
 b=DNs3zuChnkUdKBcZ8P3b68Dwup5+3sqxzqjtfKitkuVRZ6Yj8chwxIJFwhErQ54D1CWCU
 UcdG4yzatk9HoZtcal22GIA3Wdq58skEEnzx2u0GHQIig+QK5TFR39RG9qoyh54Vi9hIonj
 zABVUPdnIN+9fGDFVahmpycnhI9GECLPYeA/kGGLErzyPAYK3r0ofeyUXEfGaQVyUAtLdN3
 nR1teDQsjyspZ1+CjbKJLvyzQkGcSHxmfRULw9RXyP3HkYILANiKEA7VPv3bxLzaBm5dosj
 oZsvV8KI5Yl0akoWRaypBeAxbYWolreWqOKrVmWi/BTTxywA5gcaHZoscxIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768614469; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Is2QYzXV7syv6o9UBKDyAvQbGu+wtNmSxhw+M7QC3N4=;
 b=EQgcxVDfrdpsuoQ4Ge9oUU100VBjIi4Onn0zQRrH6AyngQagY8xC3w4YSjS5qospfTJrE
 S7tJwugvEYtvQt2xnJ19pf+PNPt+8DQjjd+U4U3YOtwPKo+fIk6ratVQzsiFe8Lw0p5uRu6
 vjPVZN4NdWBZutbUJNQakOy3htL/E+eH3R+DuG1QYvOz2SqnfJqoAOR4r0KGvO7OtISt80+
 WIpcPrGwzErM4c2rsFAfFBPdTOd+01uaVUZr45EkEtu6BEFPqxHnPyychBAkjx1ffUKWCXE
 nLVqk2bU0VdJdn2vg9FUKOi6f7aPvzDQmgNnpXiHyvFQmUIwlKtcf40RYKbw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 23B33400C5
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 01:47:46 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5FB10E044
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 01:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUQpMo9QwlPKzIfugjRZEPvajqDg7E/lXwQIIQzOeJWEVERiWj9pZl94qorNrYcDlzgBjHzBtSMHD1HtQ+we0+35YqqMfafx/vRerAzeXwGYig0Ms4qdSimQkeG5GxZlRAd/ca9i0ZekTaVCeQg8rYLca8DNQ3EcKLv/trivb22FJiJwQwpAyud4UoDM8IyJyRGNjSLzpMRjG7UGA6cGcmyyZEnnDcyMmIAXc7f2khlNPJ6DazSlV+u89nhDij3NWWqj/YRUmzYtoaKYWGmNwjhL/XiRI7XK4091OvzoTlci239AZcBc4RZKhvCAcnnNoqGrSS18E9qUzMtOl0clRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is2QYzXV7syv6o9UBKDyAvQbGu+wtNmSxhw+M7QC3N4=;
 b=ferNVrz5OjVDvgEh0RQwCUj4Yli9QGTJ1bAArJ2wXyIxW2Ukk83/e4zOsuOaQvkrvdCDr4zywKnrf5XB0cqkZbWN/ekSq3ow7GekjQP6M8smz6szi0MhwCzdql5asV80nVM7JVIKLpJmaduSISgFjeiRu3TVmco3U00/es+DCwdjcN5pZQm514S1I1ztgWuk/d6JxqSxJMBUVsOwiUDw6AAxQ9XJ6zjxBTaaiNbRbNFwe7ddgOK8pjRMkLCH0eOH4hSvBZ0zt4ca/6V9Aqj/hQMYHJfeAyIMw3mXcLJxK5iz6s37Z3kZ2mJ+ObGP2DuRseF5nW+eQtohTrefScZw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is2QYzXV7syv6o9UBKDyAvQbGu+wtNmSxhw+M7QC3N4=;
 b=Zjb4M4yx8QgavlCW9DiMaMXzeia8dyejgM99LwMFn500KFmfY4g3TzAgWfCeROIYMpu5t3JolCj5GcUIouO474rGRw0R2+PKT/zuIQ/vsvlx8oKE/gGxSiy8h3m7BaRv9ReKeWQzGiv+WMTB7ZHr2n6kv08r74Nvh2IV4gWTsOp6Cj3p+y1ttE+ru4a0aWOisEraP22iWFKrSoQ4L6HzvUHXbmv+av0i9XCj9noCprIrrKCgiRhTgxYRDNKIvj+q2OjstaHf8QjuA1h+Bmd5Vo9QDW1l+OV3dTEB8zdVxtv1LYR8nkdsHNpNcgR8nSHZwiuMkIOuQ7z4AooqMITIIA==
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 01:56:19 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%5]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 01:56:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 10:55:33 +0900
Message-Id: <DFQHO4129L0Y.2RND2QTLDSTWZ@nvidia.com>
Subject: Re: [PATCH v6 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-12-ttabi@nvidia.com>
 <DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org>
In-Reply-To: <DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org>
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a3cc53-b739-4d80-549e-08de556b8b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bktGb2hpdGltdUd4SXBjdHFTQXdFYWVlN1pRK215VnQyL1VmMFlBMDBUM3Iw?=
 =?utf-8?B?MVhsZzhSTzZ2QWE3Qm9WcXlrUmx6ZkJrekVFVlNwQW4rd3VqWG1JaDN0Y0lT?=
 =?utf-8?B?MEJCeGkrK2prQzJlQU56TmdBTktuVGoweTQwRndJMFIrRlFVekc2VlBNc2RB?=
 =?utf-8?B?L1lKOW5TMXQwR2VTNXlmUlRxRGtCOE4zRVlhdXJGNEFSUitNWnpGdktKQTRv?=
 =?utf-8?B?TENqZyt4UGYwT3pjR2ZkUUtYc0NXT25CNmF0VzIyL3lRQ3NVeUVzV0g5cmtt?=
 =?utf-8?B?SzRJUDdkVi9UTUJ2YVRsbUF0bzBCR2dDdmt1WTdrek0wZGJaQ0g3QWtYSzVO?=
 =?utf-8?B?SDUyNkM1NmpqemVIdU9RVnNzMWR5N1EzZmxYRUNldFFyemRrN1R2Q0dnbDdV?=
 =?utf-8?B?YkpFVDFrSUF1YmZyK2ZQTGY1bFBrWUxNSEdjWU5RVmg5KzJrTWlLTkFqWUhJ?=
 =?utf-8?B?eUI5MlRBY0RJMkt3b0tUdnV2aFNRTHVFK3V3Sjh0UGpHTDVsNGlzTm9NTjRa?=
 =?utf-8?B?Y01qTitrQUU0OVFBUzV2VmFQRDF4czRtcWFWbHZvL1dGU250ZHFVWWZlaG1B?=
 =?utf-8?B?RFVSNnhybVJubHd4anZMdWwwVGxoWWl1MmRBL0NHVFZ2b3EwdkhXbHgzelF6?=
 =?utf-8?B?NnRZQjE2TWZmMHl0RXBXclYwcXh5SVRlRS9zbFN2NnJpVUdXNlorNzUvYWNs?=
 =?utf-8?B?MWY4RzV5MzNhWko1VDA1RUtCbjNOb1ZUTktoNmd3RklSeWsrV25SeU12TWVF?=
 =?utf-8?B?Z2dtNW91R2tpQndjZDZ6cFhXNlgxbVVDdEEraEJNM3VTRFBQdUZNUHFCZS9K?=
 =?utf-8?B?S1dFd1I1ck1UbUZJWVRZeWIxbllQVlROYUsrRldJbElBamdqRnVoT3RHQXV3?=
 =?utf-8?B?TGFxZEZ2L2RvS3ZDUXRaUjV0R05MQk85SXdwQkNpZDhJRDRzU2orK1U2Vzhp?=
 =?utf-8?B?YzB3Rm85M09BcXNxdXloR0lmQVVRQTIwR3Fua2dyUmdtRW9oeXhpRkt0QVM1?=
 =?utf-8?B?TnVPRlZhNytTclg1cDY2Ny9IT1FwZllySXdWZXNBRGVNaTlHZ2FJTTRXaVpT?=
 =?utf-8?B?QUNIOExxS3krcWtxYjJxUWc1c01CL3UyQTRiZ0tZSXE3cTN2dGRSL2VUWENS?=
 =?utf-8?B?QzUxd1QvaTRncWJOWnBGMHBUcS9QZUZQN3ZXRTVLdU1NTSsveHZ1cHZsbnI4?=
 =?utf-8?B?NlQ1Y05JTVNhaVI4RmpMRXhyekxkMHAzRkNqWjJKQllvMW1UTUwzNE5oaklx?=
 =?utf-8?B?bi9WLzhOZHlBUjA3UDNLVUdJVHdXZCtFQzJwQ2FSQk1iQU9jK0trZkFMSG14?=
 =?utf-8?B?WTgzR09Wb0dsTjRiOVZ5Y2tYZ1dQanBaeTFhblJWd1NDbnFwcmFRNUcxSm9D?=
 =?utf-8?B?VzJrN2lDRmhXTTRDQjR4czZpT3hmQm9MMUtpdmVnMkkwRm1KZ1dXb2JkaWNt?=
 =?utf-8?B?RDlqNTJEaXFPVU5DWUJCQmYzWlg4dzhFTVVpYm13eVc4c0hTa0h5QUdJaFVB?=
 =?utf-8?B?ZW5HdDhLY3BHNC9xbnprb2NpeXhLREJpcU9CMlh5Z3U2RWlJZHNLVWxXMVpL?=
 =?utf-8?B?TTdwTitUc0FWRWdFOE5DNXlEU2drbEVSTDdrZE41WjZkWURBRk5UQUEwbW8r?=
 =?utf-8?B?Y1dIUmZ6WkdYeUhUdTdJZzd6MllhSzduaVd0N0ZhU1B2UlB1cHh5SkdYbGt2?=
 =?utf-8?B?WGxoMDJ0bXZoWUVjaklydHdoSWF1RVlmUStuOGhIdTdWbzhkOXpTUGdCaXF5?=
 =?utf-8?B?YVZJSXJjSlExUnJFSWl5M1FzZlpYSExmcDFVSjlrd1FJZmJGdXYxRDBlTGdZ?=
 =?utf-8?B?RU56djBhckNteXh4UjFSb00yektZczBsRVYvTlU3ZCsrZmdaOG5DazdVdzlv?=
 =?utf-8?B?VlE3clZOaEZheGl2QWhuSmRvdW1XMTN0ZWVKZE1oTVNsZ3BjazhRNXNxQWg0?=
 =?utf-8?B?N24zeWpUSUpCMXhDSlJlMXE5cG5uNHJFQ3hlSkhoeU1iSFBSdldRSG1naVUr?=
 =?utf-8?B?WFRJR3hHbFd0MDJJV2RrdVdVd1lLU1FhYzczZ3Q1VW1lazdoYnpIL212QzRM?=
 =?utf-8?B?aWRYTW1YdVNLbTlBUk1XMU1ZSEVLQ3d6VnoxTmJwRjZoNHlQak1JRU9qajE3?=
 =?utf-8?Q?B0Yw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVlITjZkdytPb0dKWVlvNEVpRmJDR3V6cXhCc3BQWkZaZ3IvN0w1MkZ5VE5C?=
 =?utf-8?B?bm9pOG0rZ2hBSmVyckNDQ3RIcWkvdnBoSUJ3OHA2QTRNU3hmVnZOaW0wczMv?=
 =?utf-8?B?SWs4cXFtN2xhYUg4d2k3cFB3Yi9sVXRhNjZ5UEs4b3RGY0NRc3hwMXpaRy9s?=
 =?utf-8?B?cXdVTGFWOU5vbDdGMlc4aUJVMkEySk1FS25GeHpzWHJlMDhQVzkvakN1eVVW?=
 =?utf-8?B?YVFvanZ1bHoweFY2RFVVY2FLbkdRTmZmb2pWZTZrRmJiZ2lpT2NUcU15TFBh?=
 =?utf-8?B?V1h4NFJFWGpHSitjWVdza1l3LzVjY3NLMHAvZjVRaEhNL01ld3VmbllnbHJE?=
 =?utf-8?B?azgvbDhBMnM2VEpCWXBKT1NlR2pRTnFIMW9ZUnhpN24wcDl0VTdtMzRab0hX?=
 =?utf-8?B?Rk51d0xnbWo3RVdXK25tcllpdjFybjM2M2dNdE52VGdNYlhjN0UrcEE4Lzdo?=
 =?utf-8?B?R2drMldhMWpmeDdjOE1QL3hhN1ZXOUNjT2tYTlRacmgrd0dCRlAwS3Qxd3A1?=
 =?utf-8?B?Y0s3Y0tWM0RJN2lZWE9xTFJNRzFSbVJDQ0xENkIyVmdHRnRWcys3S004cXYy?=
 =?utf-8?B?aFIxOXViVjk3bEpla2FHOE1LZXFIblNYbkkyZUU3djJocFpoVUlWcWZkK3Ir?=
 =?utf-8?B?R1VmOFYrS01PQVA2WlVjRnVSOXJnNHlwaHREd2lyelBnVUl3UDREa280RlJi?=
 =?utf-8?B?S0l1eU9RalExRTdydWNpY0phbExNRFRiOTVwWENRU0JreU8zTE1MOStGRzNx?=
 =?utf-8?B?Y1B5aDJvbHlUUzhRUWpzMFBIZXZOUWQ1RUtHYVU3RzBsZTFCanNFQUppSjFN?=
 =?utf-8?B?U2o4UXBkektzenBaY3R1RkRqblUzd0wrUzBkS0xpd3lGd29XMlJyUi94QUFv?=
 =?utf-8?B?Y0RhWVZ6bEhsZWloSmRaWWJVbStjT1ZqVW1qaGw4eXpYRlFCdk5Qd0tXaFZ3?=
 =?utf-8?B?SUdsMjUyblNRbUpkUkVLV2JMcGNBdWEvY3kvY2RHRFM2VmIzcnJ1aC9SNzRR?=
 =?utf-8?B?MVpxUWxmd0h0LytIM201VGpTazFHQVZiQ21KdFh5RGM0VFA5VU9pU1V6Y09p?=
 =?utf-8?B?VldmYTF5a0RmbG5QZ1hMY1ViQ08xZWFLdmdZRFhueVVLY3JLM2phc1BRRlV0?=
 =?utf-8?B?OGJqZjR1Tm13c3RMTWpmYjVnUFErUkYzY01JWkQyQmttWm1VemxSemVjS0JT?=
 =?utf-8?B?bFRkTXI5WDF3b3dReFZzMUtBUjZzeHlFRmJjZ2RmOVNHODU0djBhK1hLQzgy?=
 =?utf-8?B?c2cyS0JERjhJNEVKWVplMFFnbGpXMXJhRmhvN1JELzR0U1k2VmtpbytVWDlT?=
 =?utf-8?B?VC9FNzVTZDFsVzc0NXh2UmNBWnROQS9ySmE1ZnZhNGl0OHNGZ0VGWHd6ZXpB?=
 =?utf-8?B?OHFOS0tPeDViMHJuN25hcnY1UnZ4M3NDRzVKNDJaL29McWR5aUxhM3BBUS9U?=
 =?utf-8?B?eUo2bEJPcVpZUmJlRE9qdkxJTGtVQUlHYUtpWlJnbG1IUmU1azR0Z2ZxYzdQ?=
 =?utf-8?B?RkhUZXh3UDdTRngwdzk3dTlkdjZ0a0FwMEF1NHcwdkVCcDNvL3YxcGtqV3NX?=
 =?utf-8?B?NkU5eHBjMzZkckJqcHRFQnpiV3hzZEZIUGl0VHM2QW04bVdIVS9uaDBYRVo3?=
 =?utf-8?B?L0pOV1U3c0twWGdiRjhMZmlNMXBBSm9LbGVkSGc2bitZSGxwQk1LSUZlS1Q3?=
 =?utf-8?B?eGNNMmFWNWJCdElIY3BUTUUyYXNydElMWTRYdmJSMDVXVXF2azN2M1g5b2ZE?=
 =?utf-8?B?akNDbkFrSjN1N1NDdDFpQmV4UFFqTThKVENDOUxGYmNzVTYyMkZRM0crOXpz?=
 =?utf-8?B?RlRGdUdzOXpTWnMzZEJGb3RaSk1WVm5TSENFNFVGZ2VLNFpEMHlFbFJrdVZO?=
 =?utf-8?B?R3BqSmZEWWtzNmZKRzJhZDQwYjhnakNkNDdMemhRVks4aHMzMEN3L3kvQXhB?=
 =?utf-8?B?eW1PTTk4L3BpVXIybTlTODUwSXZKcXlQeTl2L3ZwNnJleVhxWW1VbnoweklN?=
 =?utf-8?B?ZSthNHNNdW5iejNwaG1hOEtHWFRFd1dMSWcxbUp4bjhBVm9JM3BlenBjSnlw?=
 =?utf-8?B?YTdpeDZ3QWJvTGtYM01uRXFRczluckFrL2RsNlhMU2g5YmIzc0tTVjZDcVFH?=
 =?utf-8?B?WmRVMTRGVisrR0ZjYnFGSys1Mjcxb3ArR3ZyOXB6YlI0U1ZUS28rOUY0Um1k?=
 =?utf-8?B?MlhWZWo3OE5pd2JaUjVOMGhLYVhibGtuYkFWaytVVXh6dXFVTDJvbWh2Mlg0?=
 =?utf-8?B?N3NqaG5WR0pGenRjZnNEZWxWRkxFRGJwYm9KNzM4MkNmN1h5cDdnTnlpazB3?=
 =?utf-8?B?Yk5GL09ZWC9rTis5RklRY0xiSlB6YUlJeXpTcVRRUVFMSnVNRTRtenhiaWJy?=
 =?utf-8?Q?/l42Ilzr4wnMXwNf7u2FmsCy1CmGfl5RVAGxtujGMfKHI?=
X-MS-Exchange-AntiSpam-MessageData-1: vilDNkZJFQJE4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8a3cc53-b739-4d80-549e-08de556b8b1d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 01:56:19.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zi8avuXB+WA0uHd4m53JNMO8UDXJ2tfu8rJ/p9yK/wNb5JwCpsCqpQtS2U3Ze0cgcAxWgCfK5x0Vd6b7g8Ksfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466
Message-ID-Hash: FZ5R2JWFQYEJSGPUHERDW5P62TEII7SJ
X-Message-ID-Hash: FZ5R2JWFQYEJSGPUHERDW5P62TEII7SJ
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FZ5R2JWFQYEJSGPUHERDW5P62TEII7SJ/>
Archived-At: 
 <https://lore.freedesktop.org/DFQHO4129L0Y.2RND2QTLDSTWZ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 17, 2026 at 6:05 AM JST, Danilo Krummrich wrote:
<snip>
>> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
>> +                        .set_tag(tag)
>> +                        .write(bar, &E::ID, port);
>> +                    for word in block.chunks_exact(4) {
>> +                        let w =3D [word[0], word[1], word[2], word[3]];
>> +                        regs::NV_PFALCON_FALCON_IMEMD::default()
>> +                            .set_data(u32::from_le_bytes(w))
>> +                            .write(bar, &E::ID, port);
>> +                    }
>> +                    tag +=3D 1;
>> +                }
>> +            }
>> +            FalconMem::Dmem =3D> {
>> +                regs::NV_PFALCON_FALCON_DMEMC::default()
>> +                    .set_aincw(true)
>> +                    .set_offs(mem_base)
>> +                    .write(bar, &E::ID, port);
>> +
>> +                for block in img.chunks(256) {
>> +                    for word in block.chunks_exact(4) {
>> +                        let w =3D [word[0], word[1], word[2], word[3]];
>> +                        regs::NV_PFALCON_FALCON_DMEMD::default()
>> +                            .set_data(u32::from_le_bytes(w))
>> +                            .write(bar, &E::ID, port);
>> +                    }
>> +                }
>> +            }
>> +        }
>> +
>> +        Ok(())
>> +    }
>> +
>> +    fn pio_wr<F: FalconFirmware<Target =3D E>>(
>> +        &self,
>> +        bar: &Bar0,
>> +        fw: &F,
>> +        target_mem: FalconMem,
>> +        load_offsets: &FalconLoadTarget,
>> +        port: u8,
>> +        tag: u16,
>> +    ) -> Result {
>> +        let start =3D usize::from_safe_cast(load_offsets.src_start);
>> +        let len =3D usize::from_safe_cast(load_offsets.len);
>> +        let mem_base =3D u16::try_from(load_offsets.dst_start)?;
>> +
>> +        // SAFETY: we are the only user of the firmware image at this s=
tage
>> +        let data =3D unsafe { fw.as_slice(start, len).map_err(|_| EINVA=
L)? };
>
> Why do we need the firmware image to be backed by a DMA object at this po=
int
> when you load the firmware image through PIO anyways?

When we request the firmware, we don't know whether it is going to be
loaded via DMA or PIO. DMA does require a DMA object though, so the safe
route is to always create one and access its slice if it turns out we
will be doing PIO.

Another way would be to put the firmware into a vector and create a DMA
object on-demand in `dma_load`, but that's a more important refactoring
that we can probably keep for after this patchset should we want to do
it.

>> +}
>> +
>>  /// The FWSEC microcode, extracted from the BIOS and to be run on the G=
SP falcon.
>>  ///
>>  /// It is responsible for e.g. carving out the WPR2 region as the first=
 step of the GSP bootflow.
>> @@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
>>      desc: FalconUCodeDesc,
>>      /// GPU-accessible DMA object containing the firmware.
>>      ucode: FirmwareDmaObject<Self, Signed>,
>> +    /// Generic bootloader
>> +    gen_bootloader: Option<GenericBootloader>,
>
> I'm not convinced this is a good idea. We probably want a HAL here and ha=
ve
> different FwsecFirmware types:
>
> One with a DMA object and one with a system memory object when the archit=
ecture
> uses PIO. In the latter case the object can have a GenericBootloader fiel=
d, i.e.
> this also gets us rid of the Option and all the subsequent 'if chipset <
> Chipset::GA102' checks and 'match gbl_fw' matches below.

Yeah that's basically what I have in mind as well - the FW type using
the generic bootloader could wrap the regular FwsecFirmware as its
purpose is simply to load it. I'm trying to put together some code to
that effect but it looks like it would work and would also remove the
special-case code in the PIO loader.
