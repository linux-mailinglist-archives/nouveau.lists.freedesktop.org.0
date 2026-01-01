Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79412CECB64
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 01:48:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4800A10E7FD;
	Thu,  1 Jan 2026 00:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kDHXr/eY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5A7F044B9C;
	Thu,  1 Jan 2026 00:40:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767228008;
 b=w8v3vmSKWdcqaUGvr0yTn2uT4wIAT/gh5G3eXb/M6nc8o+8bo7MxCV88LBkf7mfyM/Wnr
 +R7f+tJvcTuNcJFE7JLcxNifgC/Gtt941/aQlZgE3H2RItdYHfFg57PsIxWzdd5McLsQxrT
 VqYN2Y+LZiFuPtCayJE8LDUvqfbth/zmiudWszRETIxh0irQzSonyLa8Xkj4wNxEHA3wXmL
 zkDycX8yNi6H+7/E3XXiUTWfTYpdcVkfJFMGLfkCvc3Q7/+1h+cqlGyTTmDR5mw8HUb7D1Z
 hBxANPQDEn2aDUWVwVNz6J6CRuD/7DQ0tp1xeeylfaxBZjhhPDeGaeBH2HLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767228008; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5y9jP8/aouI8CDvY0EhiqQDBtb1XUExyVSHQLravSG8=;
 b=jDFYZRPWzd6sfXBgWeXfqp5ZH1SKJJOSXO16C0t1g2HIO6sQy9HsMD8aw6BAWZJubFzVf
 EkVOIh3swPAu9FE/Vc5URmpxqHDS8CJmB+L/xCzq1GkzNJHLyuIFS/S8UogTYJFYKhWK8wr
 dauIGGakQc0Z/+1GvDR5yhbTJhDQ4R/V+Ygbu611FF9/Gwk3qZgsICWExoFhZlEmgaBk4Gi
 gB6KiR08cMg7oaBUcngS457v7ZT8J0IIBcJgUvFR5uxvN4WxMDZYBn+VqdBB3yLHwXlxGLs
 w+Nzqdz8ziVE04e1bE0TrblM6jHDd2LLZrWwbQe5Gie7S70LxKEl8c7W9LOg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E05144B9C
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 00:40:05 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEE510E0B0
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 00:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRz8VPhAiNSws3CMXhSmx35GJREdJEtS6Ho7s0vtxptKumwqSHRZmn/iFppc8di3Es5LnN5A4rZtD+uvfgiIiM63xcqP+AcaxCpPg/QTTJLaTDYod1Za2HWAhJyZ6zqgBtzZBYXIVoKtMv7VljnQIFKLIz0a6rpqEyElW5vinKP2invgU+VyQ6MvehzbCy4a/qK0wT410KEZLO4+Y1g55wFDxueUKfI2TedFiOhl5WZ7mNBdW9G28U/Tj1hPI0NRXWLP2DU7Cl3Z68ZodEPEjPPedMZYvcvUyzxpAD0GBUS6KsgsqIyJ9sSShGbIXE7k/YPfe9fBJUvKnfr8B63Y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y9jP8/aouI8CDvY0EhiqQDBtb1XUExyVSHQLravSG8=;
 b=bDzxmNF/jCJWCJK2AKH+hLnI3FVYgVYCSD4Z85cxIurfGrJnT4LBbOhnvyuo7NTMuj3LdDPLD2cvalpkA8wjcX5lm+yJcg07xTcDcGUUAsKJO854D6PJup8rLPbyaXqpCiEYe2U2Dww5s2Q8Ic+tarc4HAdoQP+su8jsipo0OtLwvPu92d0p4sch3+g0EYZ98LRYnxrKx+8l3bFZQi7hvBVbgg8mImNgKojEI19lTZ8wZlchFWqA9lmTaY+rS+temswru2yLtIYGzOUnP05P+swjxMw+Oh1Th0Ak21pSbsquHQUkxJHewY9r+NMdm5A8SmpveQtDQ39PgYwjT1HFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y9jP8/aouI8CDvY0EhiqQDBtb1XUExyVSHQLravSG8=;
 b=kDHXr/eYup/ggfcNX8lNu9XuA1H5sebS0YRAGlB50EDBWFU9vZhIfhMYzUG49YACwKehXC4lJZMta4DAR1hBih3sqAmN0OpkTCaX/UnlaYnQZwDIorSWHyaoIN6yq95ULSQ6yGnJXqOYoQpR1oPCXr1bNhC64BavS2rmVmhIzCS86lqwYnx3CdeF8OJoNi7Q/kBCuksZf8N8ij35SQaU9ukWh3Fg6rd2DbKVKQ9edw/nZbnGJPO5SkHZbYPOsy0tzSoHFsHxcCJ96yE7irO466bz1agObwoZYJDQhBPd+HYeL3q0PrIa+lptIkUZzz4AdnvDBgqueoA8duG0ZByluw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 00:48:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 00:48:02 +0000
Message-ID: <e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
Date: Wed, 31 Dec 2025 16:46:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
To: Joel Fernandes <joelagnelf@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
 <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
 <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
 <CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: f33ee9a7-24f3-4d63-2f6d-08de48cf6ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGM2NWhEaUJ6QTMrOVRvK0VvbFRsY1dTc3BhYUVUWFVSakZCd01JTTcvRjFJ?=
 =?utf-8?B?UjUrMzMxbHMzamxoUzA0TklRSnhScFlqNGdSSWRQdTU5dzBlUE54ODBsSDNW?=
 =?utf-8?B?RlZQL01vN3g5UWREZW9DYXJOSXk0MFNuSmFUYjJybWxFOFlnSGxYNEZjV3dO?=
 =?utf-8?B?NVhuUFNwM2RDNk56RUNaNm5yQUJWR3VsaUlZQ3BxU2F6V0w5Y1hCM2h6K3dE?=
 =?utf-8?B?RStmWGxtd1NkUkhuVVJPanduWWVuMUZ4Y0dFbEp5L092b05vU0dCcmFsRFFK?=
 =?utf-8?B?MnhMMVFEanl4Y2JtUnlZYVdWOHdSdnB5NHorZkJiWUNaQk1KUDNab2EvM09M?=
 =?utf-8?B?WjZqcHpaWnlsbWQ3cy9jYlpPVzVBbFNkbk1NMEFvVnY5RGFIQXBxWFd0QUcx?=
 =?utf-8?B?UHFkbnRKQU5yOGs1eWEwWjlENkRsbEZORExoN2ttaWd4eC9ldjZQNVptelRi?=
 =?utf-8?B?Vko5dThVVUV2a1BENHdWMVZwcUtSYzl6MG1ZWHVtV1lhWHNMRWVwZVRkY3lD?=
 =?utf-8?B?R0hGcmxJYjREclRPUDBXc05zUlVUdzhwM2oxV1Z3cXdFcFZrRUFWRkpnWDdq?=
 =?utf-8?B?THVZZm5qMmtCLzdDQlBaNXYrQVpFdUtWcnlCSXd2bXI5N0hsWTFUdGhkL2d3?=
 =?utf-8?B?S1FNS3ZYUkc5b0tpQTBHL1BMSE9ZSVhObHBKNHBFaExVb3VpeWYvM0NYUGF3?=
 =?utf-8?B?dFp1Zys4UTJ4UUZ6bitpdk0ra0hpTmVXRTVOV1pjaDEzaGYrd0lpZnF1eEhO?=
 =?utf-8?B?ZnhKU1FCUnl5eHczZit4TjFmVi9seGhwSFRaL21NbVMvUFowSTFkVW9hWHFH?=
 =?utf-8?B?T05ZK3VHUVpnKzVqRTl4MDR2ejlNY0lqNWp2ekxKQnZXWWJTRFJJbEZBaU55?=
 =?utf-8?B?eXA1RjBnUGJzRDlxbDNYTkNIVjA3M2t0b3lQN0JKTDRIWFVrekxRREZOWlRi?=
 =?utf-8?B?eFhUdVN6MTEzK3dFVmNxb3N3eHo0T0VuNGlSbk4wRVhxeXVFdXd3dVQveGl1?=
 =?utf-8?B?RGVGNDUvVU9kQVVudkVtbzBEd2d6ZE5MWnZPZ2htTUY2WjVDTW9vYlpQNlBQ?=
 =?utf-8?B?U1FweXZtN2RGajZpSFJYSUR4TGxkQUpBallvalh5NWo3VnRVVmtxUUJEVUZI?=
 =?utf-8?B?cWJiUkNxWjFWNDNIb2hOU2U4cFd1WGdnb3ZQSkRRZUZ1ZXprYklBeCtwcWN4?=
 =?utf-8?B?Yy9mOXUvaHRMUnE1Ym1kano1a3l3elhCTi92Nzc3TTdjQm1lQlpwUVJ5Q3Vp?=
 =?utf-8?B?b3VLb09tczNnVGE4cFplczh6Q3BobjFrN3RCS3ZHVmF3NHNQaHRkWTd3Zkxu?=
 =?utf-8?B?OVRCVnRBcWhxajJxSlQ3OUEzaklSM2FPM2VRWEJUMjRJTWIvSVhodnUyZkV0?=
 =?utf-8?B?NWR4RzJQSWJrT1pkakd2UE1WY3JSQmZQNUVvQU9UN0pjOE54bHlDakt5cVhx?=
 =?utf-8?B?Vno5TU9vOS9XZ1g4aDZ5WmVtcWpTOEdMeW95SWNUK2FhMVdmbmtIdmNCN0RB?=
 =?utf-8?B?N09leHFTWjZSeGZGNVBZUG0vZEFJWnU3R0xWdXhjY0tQVmZGUmc1RTVFYXN3?=
 =?utf-8?B?R0ZQZDZWclBFVWZGWWFSU2xobnRxUzJoc085cTN5MWdLZDh2WHpaNXdFR1l3?=
 =?utf-8?B?ejFTcm5SZ0EwN3dIeUtadlc1cVJZUEJlTXpYcWhzcDZ1SVA1TWNLNFhrMXhG?=
 =?utf-8?B?RVByWWY5MlV0V1R4NmEwZXd2NXl2SlQ2QzlBaHMwbUdWMit0OU1RNnZhVldJ?=
 =?utf-8?B?TU5zV29ZZThIUHdxeTJycTFROXhoQzFmazUwb1lKSFNzM3pwT1ZydWMrM3VB?=
 =?utf-8?B?amc5L1k2elV0NFpwMzdXTmtyMldMQVA1TzFTOVhtNmFIMk02T2hMY0pYWkx2?=
 =?utf-8?B?cGFHODFRVkUxVUFWeFB6YlVEZjVsQTlHTGZHSkZOMGttUXI2UGRjNnBZbTY4?=
 =?utf-8?Q?Rx5KvJC7eBN5HEXrpMInSwjaFC4avHQU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mkw4RFdlMjQ2UXNwcHYvSWppcVgxaWNWWkpRZFF0SVdXZmV6cFVVRkFDM2NC?=
 =?utf-8?B?UVNCdHRXbWtza2Z6a1pNZVFLSXZUYWVsQWdDZmdVdjc5azRUUVRPM2E3UDZB?=
 =?utf-8?B?UmVZcVdVaDNoL0xQUVZpdmJYOFBTSVd5UkhQcC9KaGhQRFRyTnB2L0RNcm1t?=
 =?utf-8?B?c3pVNVVtOXcyZjdlT3RLTk9YekVtVHQweXZaay83cHNuMEVTUnhuZnFtSTVz?=
 =?utf-8?B?WUhxd1Y1TldQeHpldDJ1dXY4NjROd240UzRZdHVaVnp3MmlDTExPTFhJT29k?=
 =?utf-8?B?ZFFNTGJmMjlMNHRPOEUyMXRsT3RqVit6RHNpcjlha2gwT21Ia2g5NVh3RjVY?=
 =?utf-8?B?NTVjVWZubXdvc2Z0Y0F0Vi9DSHJXWUsxNWJsQUwzSER6U3plemRlWWJsMElu?=
 =?utf-8?B?V2xWT2ljaGtjQzJWTUtwV09KRkNsaXcyTW9RcTJuYy9SYVdFQ0JFMzQyN2gw?=
 =?utf-8?B?NWVLRnM0K2loZE93MjNLejJCRlZwNGx3dEJ4Y01zYUFOU0lTT0VrcDFVd3Fs?=
 =?utf-8?B?d014a1JsdEFZVmJ1dzhpaDRHTjQ0MXMxdFhXRElheUVUcHBjdjRjcUtFNUZn?=
 =?utf-8?B?aGFjOE9BclBNeWtKQjN3UGFSSWxuRkJQaHRGY014VG1kZWZoOHZwTlFUL05U?=
 =?utf-8?B?UzNYWnJUWjhSR2g4dTdDREJpWVdyRFUzcDVJRWZEbGV1WHFTZm9BY09oVUgv?=
 =?utf-8?B?UDd6WlhyTy9vNGU0eVNlS3hHVkQxNjVsWlFlaVVLeFBkbUo5SXROQTRQS3dp?=
 =?utf-8?B?bUVOT1BRelE4cVBFUVBRanNUTEU4a3VJazNKUG5DVUR6a2x1bnRWNll2VndR?=
 =?utf-8?B?M0NTbXJTZVdsQzlPWlpXRmFOanVqc1dBQWFrVkpPUC83TGI3UVJJUW5ZeWR1?=
 =?utf-8?B?UVZpamFyNjdqUXRNSkUzWmNCVG44NEFPZWlwZy9RWjAxQmREQUZiVjd1bUhp?=
 =?utf-8?B?UElMRnpSNWtZelBYSkZHRnNWRzdtY0hhVnNmWXJKMjQ3azhjaXkxLzBpMGF6?=
 =?utf-8?B?WVAxdk9JdUJDVnBaSmZJSWkzc0F5Q3U2WTUzZ2tjUkpML3BodnlRTnR5eWh2?=
 =?utf-8?B?b2NOSVNRdFRJVWowNVFNaHBzVzVidzF1VWNCeXlzdXgxc25qTWxxYmNNaFJa?=
 =?utf-8?B?RzNlZ0pkd2xTdDJsb0tUSDd2endxc09KbFdUaC9HTWRVVFh2aC9PemlER01p?=
 =?utf-8?B?clE5SDNYdW1EbDNxVnhzRnp6YUhJZkZlZ0p3MWJ3Yk5KWWZUUzVrMFJVZFg5?=
 =?utf-8?B?YUVrNzFmZU1rbW50VnBoaVhzQjhpZ0lZQjZzQlhCTjZDVWNtOXVucDF2RFg4?=
 =?utf-8?B?K0k4dFBXbWZ3bFpTRlFyM29DVHpJVWQ1YjN6ME16SWx0UTNiN3hydlVHTnZ0?=
 =?utf-8?B?L01MVXp3WldZMm5KbUhhaWxmTjdQQnY3cmp6WGtVWmJNaUVlLzh1NFpnR3dv?=
 =?utf-8?B?eTFUckp3S1UvTkdFREt0YVhvdEsxUGZ0bG5Gb2w4SmVOWmc3ZkF6b1lQZWFS?=
 =?utf-8?B?T0huMmxuM0Q2TUhUcFJnSGdiNmdRT2dhRm5xUWlVM1k4bklTZGFSZDZ0QkZa?=
 =?utf-8?B?Y2h2V0VkTElxZkRlcm5RRGZOMXFncWtHZy84RHkyc3VJUFJiKzNpK1Fwcjls?=
 =?utf-8?B?Wk1CQy9DRXA2R1pZVUVCQWRLeFh1NmNuOXBZenVHeHdnbXFlMW82VkUxYlU3?=
 =?utf-8?B?NitmYkt1THpvbXc2akZsa01CMTdQNFkwTEwwTmZEcDZuZWZlcVVXMDBFVUNW?=
 =?utf-8?B?NGw1akgxSDdLUzN3d1BjY2tqRy8vMXFNd2NhQ0RQbHZrVFNTUW95d1J5SzlE?=
 =?utf-8?B?T3R4cUpDTG85YXdDSUZqN2J4ZUhaNyt0dm5wZGJYVUFSWHhUcDl3QlBKLzJq?=
 =?utf-8?B?Z3FQZ3RLd2p5eGlRbG1PbWszdC9HVVpvOGI1MVFCZUN0OWsvalI0Tm1FZ3ox?=
 =?utf-8?B?Rk5xak9maUQ3eWFuTEFocitSY09pQyttYnV5TXpzVi9FbE5IdS8wQ1RXUHNI?=
 =?utf-8?B?ZWRLUmpVTnFybldZYko0clo4aDN0bjBwOGM5c1U2bGpobkZ5VUI2WUpCTDk0?=
 =?utf-8?B?SDd6OThsY3ZqT1MzbUNJUElDOXFpa3M5SStRcEdnaW9aZ2dRUnlKMi84TERN?=
 =?utf-8?B?dTlNZWFOLzZLTHlkeGUzbTh0YW45VElXK1RaVHJwaXlNMk1XYXdyWjFRaUtq?=
 =?utf-8?B?cE1yVTVOSjdxSzl5REorL2p0WUtrcDl5bzBaTExTTzh3YWRST21wRHVqN0ho?=
 =?utf-8?B?eHJhaGJHVUFrWnc0R3h0VThwOWJIVUUyZ1VlYkdCTnNyZUx3cjlGSDZkWVBS?=
 =?utf-8?B?cGl3UmVIVnRhV2VBbTJtZmxRWDNxTkRVWE16NWNid2ZkNnIrVEFKdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f33ee9a7-24f3-4d63-2f6d-08de48cf6ad9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 00:48:02.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WoSelu6X8ZmG0Ws9uJqWLcZlgBxYyyXsKrG3ziAQdTrUVcXv9g+COTYJxLk9jkkULVReHFn7ZhHlxcooAH4eow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546
Message-ID-Hash: QKK756PHDPVY4US2EAWMHZTTDNY22B53
X-Message-ID-Hash: QKK756PHDPVY4US2EAWMHZTTDNY22B53
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QKK756PHDPVY4US2EAWMHZTTDNY22B53/>
Archived-At: 
 <https://lore.freedesktop.org/e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/31/25 4:15 PM, Joel Fernandes wrote:
>> On Dec 31, 2025, at 5:47 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> ﻿On 12/31/25 2:33 PM, Timur Tabi wrote:
>>>> On Wed, 2025-12-31 at 13:47 -0800, John Hubbard wrote:
>>>> The builder-pattern setters (self -> Self) enabled method chaining like:
>>>>
>>>>     reg.set_foo(x).set_sec(y).write(bar);
>>>>
>>>> This made separate operations appear as a single expression, obscuring
>>>> that each setter is a distinct mutation. 
>>>
>>> So you're concerned about the fact that the compiler is not merging the set_foo(x) and the
>>> set_sec(y) into a single read-modify-write?
>>
>> No, I don't care about that aspect.
>>
>>>
>>>> These setters are infallible,
>>>> so the chaining provides no error-propagation benefit—it just obscures
>>>> what are simple, independent assignments.
>>>>
>>>> Change the bitfield!() macro to generate `&mut self` setters, so each
>>>> operation is a distinct statement:
>>>>
>>>>     reg.set_foo(x);
>>>>     reg.set_sec(y);
>>>>     reg.write(bar);
>>>
>>> Are you sure about this?  It just seems like you're throwing out a neat little feature of Rust and
>>> replacing it with something that's very C-like.  This breaks compatible with all users of the regs
>>> macros.  Seems really disruptive for what seems to me like a cosmetic change.
>>>
>>
>> It's only a neat feature if it *does* something. In this case, it *looks*
>> like a neat Rust feature, but under the covers it really is just handing
>> around copies unnecessarily, when really, it *is* doing the C-like thing
>> in the end.
>>
>> I object to the fake Rust-ness that's being done here. It's like putting
>> hubcabs on a car.
> 
> But IMO there is only one operation here, the IO write. The setter is just mutations. Builder pattern chaining is idiomatic to Rust.
> 
> I would not call it fake Rustness since it is Rustness in the Rust language. Afair, similar arguments were made before and conclusion was, well, this is Rust.

There is nothing about doing sequential .set_foo() calls that goes against
Rust idioms.

But this really is fake chaining, because there are no Results involved.
It's not buying us anything except a bit of indirection and cognitive
load for the reader.

> 
> Regarding the copies, I am intrigued - have you verified that the code generation actually results in copies? I would be surprised if the compiler did not optimize.


No no, I just mean conceptually using Copy instead of a mutable Self.

thanks,
-- 
John Hubbard

