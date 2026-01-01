Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7CCECC5E
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 03:52:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAA610E403;
	Thu,  1 Jan 2026 02:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EEyksGjU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7535844C88;
	Thu,  1 Jan 2026 02:44:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767235470;
 b=SVfUG1Am+LMCQ77dZc8vKm4B7YcmAseMGWbCxT3eFDzyrxs4HhbCXzv+D5cm8QxVVB2+L
 LczjfBIGHZdvQb5TPOFEo0odeRCxLvpbWmuUWPXnfw1V55FA+HLJ2xs2SqVCL4Z1IXliaQW
 3FBv04WubmpmObls8n87fOKgL/nJsKrwpVEBAkw1BDTHPLvUBIVVN4NOKuLD0XQzEUByMly
 dvKOZCej+0IdriuYFevcukd87Lx9SnBNQoLOeoCffFKEaxgpkCHMjKCFSGlv9DZuqrp7Ig3
 97eeRgcJvFDL02fV2F2P4p+lTzJ5x6vU+ruzlfBjJcP98fhd9ydbQsfNJ4UA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767235470; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZwFBPW3U9SsONd5gToVAeob1Q1+zGa4sLwi2xbcmlLU=;
 b=dFAtjeTASzM0yOE4/3dWmp0TOt8XRUKR+ZCJhGwukysEMLmC1uO8KTEExjB0lycGLhJG4
 Xqv/5IcY/K5GSN3wYRNzWqE2PqmVsJPtVkrhz/hAPGWLlwLOmo3argH7lIpSZ2xYUxZGVjT
 ngHZOHp3UhRANXb0Wq1qxv7PhH8Hk0ASiUhqQKLpCFE2tOrJQhOSwfW1pWuzFGHz7vvB4XJ
 tswSq05sc2paGWpLP8lvUxBK/rVsu0DQ4oMSOj6AMtxyrQhIAtqqR3pKPn/K7JZFVkmNHls
 eDxgP0SOZuhu7ERpROPtB0Uhhl5FhVBJ3vpLiaZ9VeNmSnnt8ELHrUhJVbzg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AAD5F44C5B
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 02:44:28 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5711C10E04C
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 02:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxqO1q2cTMWW/gClMfyOMtnflpAYGDOCgtwB3q5T88wToREIB2FZ1sVwG8BHhMvj0aQyt+qTiaJEnJuW7vPI8P9QlRCYGVM8ddr88Q2hD2O7aNQhXRTSfGJfjL/9VcqJNXB65rhEm+gd5RVyrggqxWsN1Q9pw2K7JVO+V2F8EE/7PHUmEDNHjtx+tgimHSbuv5SAQTUooTw3/IC5qPU2kpbNNlSuDcm8ZONrt/ciX/jnZsq5Z2eYUjRPXXxOV5iHODio8GQzHvGQGyINdbMG1MRAfY70CSIaEO2Phd5mK20vJHiNdIChmIXfECm3HXoLL+2uxqre7rTwJXxJr+Kk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwFBPW3U9SsONd5gToVAeob1Q1+zGa4sLwi2xbcmlLU=;
 b=Q3jkaue47zqRsLvcUDOoLNWHPlZA4ywgEV2MY1Kxaq/AMytEMqUJE0pnJDM2YlTGTJHHdaLAEj+Xiaj9Ntol3riUfpsk5VOeqSu9R5WG04+4miq5UlJA0eusImpM23BXmnMCDG4m1YkfRx0561Y9VKNex+FW0LutHs819RKhJ+sqeNF19HvbnjZGVZtSpEtqXagmwepNCxff2EA0TEf4NiJHGVnoJw7N4Y1f99FieA4WRbhk3ZpTPQ5P0fAIu7RbcETFVuSkCH+2nDbuEgfM7ZwyXAJPc9ONRY/8Ch+itgRDJr9qiacPw0PLGPKv/8z7Ix9dKBI32OuwQTw6wVMrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwFBPW3U9SsONd5gToVAeob1Q1+zGa4sLwi2xbcmlLU=;
 b=EEyksGjU/m1JcB3UjVNFi5LVsyVD9RIu1cEcGk1uDk6vZIH5LGQJp5pYv8+6/3a73mGOfXBZ9L32sfQI0tAKRdO032P5cgPzUzUMXlAKB8wSRP36QHoX/FE0eHWAS7jqV1IJ0OykS06t1AZFwQSSRbg65gsDMJN49npyS4OzNJZdtWFWZi+rhF2aBhteHZC64eQJnMDa5CWk1iUfmzmoki0WKLqmA1w0utmmoMh004FL9J9ZiB26LNWWLsnT/NzjR3w/lJqZMWM+nDiyzNWWcTDTmazsXa66uJ5tLSLA8PyCnVzqSUbQbIcm8ZKJcfOhW0Rh7HwEEBrT3eCn9N2+7g==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 02:52:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 02:52:23 +0000
Message-ID: <d1a8fab7-f405-4b4e-84f9-8057c25c5ee3@nvidia.com>
Date: Wed, 31 Dec 2025 18:52:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
To: Joel Fernandes <joelagnelf@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
 <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
 <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
 <CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
 <e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
 <efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d17e81-ec90-4a31-599f-08de48e0ca22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnV0M0dLa3RJbUk5dFFVMFhucjhER2kyQXlEMnE3RkcrWlFuTE1VNHJISTAx?=
 =?utf-8?B?S0Fwc1BwaFVsb0RhRXJnMWZXNVlpcGtVVVRuZmR3U0FDQ2NaVXhUMUFOMzk4?=
 =?utf-8?B?b1ZzbGdhbHBtejYvbG1BRDJNdmdIeVprV0lra0JScWE1Qm9MamhwS0N3b05t?=
 =?utf-8?B?WDRhSXNUL3VHdmkxRmJsRFBHQ1RLNmpjZVZyWGNJeGY0V2Z3aFlsNTRXT2pv?=
 =?utf-8?B?azRZaThtNVYzaWM1YUQ5NzZYd0NDcVBwNUZSUUNJWlZ6NkFybk1PRXIxajhV?=
 =?utf-8?B?ckxlcWhIZEJQb292UFAzUnV1Vm5YdzdyNmlSbmxRTjRodFU0bm5iR3lycS9G?=
 =?utf-8?B?Q1BXWFFvRU1sNDcxenZWNlQ4b0Q3dWV6WDdUKytrT2lYSGEydXR5TUdySytr?=
 =?utf-8?B?OWl6L2ltNzZ3ME5DUVAzRFRFa1ZLOXZwbVBKOVpnWjJpeUZ3bzQvK0hPalRk?=
 =?utf-8?B?V044M2NZQjZZQlVDVm1mV3A2djNRTU9lc0ZZMG1QR2lRc2JGeHVwaWlSZjdH?=
 =?utf-8?B?RFFycFpJM0lKNzE1TTJqb092SkNDSkRkYU15MmRXVHpUdmhGZzM2dnR0QVFZ?=
 =?utf-8?B?SmxWWmFpMW5DN2NtMlpLcGkxUHp2Q2tpaFA1eDBqV1hzR00zT3NRZCt1TzR0?=
 =?utf-8?B?aENIQVRmaWVFZlFqcWRsbW9KaUZhZVoyQ202U1U3NGh5bUdGREFBSHdkNXZQ?=
 =?utf-8?B?MkhxdVhwODBST3liaVU2c1B1Q09CRldtbTRxYVFWTVlRS1JIQjlsZ3BBTlBN?=
 =?utf-8?B?WFlqVlVRWGdjWkxaR3VQZHUvd1RBbnVrVVViMThtVFM3SzA1emcwaEExNXNm?=
 =?utf-8?B?cUdsdVRoVU85OGtvMXpGeVZSMGV1ZGZueWZBYms5VXNSbmVzTElzV3VXVFVt?=
 =?utf-8?B?U0xTV05IeGt4VWNlYmpzQ0JQZHdWRVo1NmFVdGFoY2xxQ3R3V1Nsc09Oc290?=
 =?utf-8?B?QUdhNEl4c2pESTUvTW9xN1hsVTBvNFpYbUxhQ3VhR2JvRXpFTTFLWTZqVHpk?=
 =?utf-8?B?OTRwWVk1NFd0YXhQWk9qYi9kTnFaTURRb0g2cFBrdStKa1ZzM1B3dExtbFdZ?=
 =?utf-8?B?OTFLUUxUN2ZHZ2pkeTRjKzUycjZibTZSb3JjeldJQnZUclFUUHpiVDNCaFZP?=
 =?utf-8?B?bkYvTGczQUNVdE90UjBEU3kvY2h3SGVMUVFFTDYvYWZVUnRxU1pmeG4xTjYr?=
 =?utf-8?B?TElvNExpZnpVc3pXL3AvZUFRWitSaUFKS3RydkZxRVRlTWNoZzErZ1RRSzQw?=
 =?utf-8?B?b0FZcWhDcEdPdUlBeUc2dEpNSlpiUkM4eVZSVkcwV1dnTUFZcWQzUHB0OVp3?=
 =?utf-8?B?eG9GZVd3M1g3WXVKYkV4WGxKN3Fsc00ybHZPOXQrU2JEMkFUcE83c0FGS2gv?=
 =?utf-8?B?U2tzc002RGdHVTJlNnc5cWdwcHhwOU5UWVVzRlczSzF6YW5YUndKSUx1V2ND?=
 =?utf-8?B?THVnYWFDbW9oMGtCVjdYaTkwUndqT3ZFL1FRcFlpTlp5cGlpSVd2dmNseXNt?=
 =?utf-8?B?a0h2WXQwMkJBYzdocFUzbXVtTjNFVlc4blpoUUd6ZXVYbmxIcEJ2ZkZWOGE2?=
 =?utf-8?B?SzhRV09vejJYeXEzd2xXRys1d0FmTzBlR1JaMHRjNnN2Ykx0dmM2TnRqSWFP?=
 =?utf-8?B?QUNZNW1sd2NPVzV0TmVBL01YNjhaR1l2K0JsZFBMNW9MRWNLV25NdlRvM2Y0?=
 =?utf-8?B?RTVzMEdOL1lZNjdpeTFOMWRzN0lJTkhNK0RBS2pEd2ZtTG5KM0tnQ2p1dStX?=
 =?utf-8?B?UG9nZ2dXd0h2dzA3TE1iN0xkbDg5VHVTTUR2MUI0SmY4WHFydlNWV3hnRGJN?=
 =?utf-8?B?K0lNcUdDZjVCaWRzMmhjL2JSTjlwZkxuZ0ZzeFlEWFNnYlZvUUdqYWN1UThB?=
 =?utf-8?B?VkRWUWJweEU4aTZ0MzM5OTNsNnZ3ekkvNVFkYzFoYWx6MzFiTGt6STF2NW9o?=
 =?utf-8?Q?0rlhXfnSARgERaY14Rbnm10Kiu1IgEVt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkFrK0RzN0lSZExLaGl2NmpadUNabSsxRk5nQXhFRUVnNlZkL1FmZjVPZ0Y5?=
 =?utf-8?B?bDBTdXFzWktWVUZFK2IrRS9SOVljK042dzJrOFBqUWtpb1N5WWdzS2kydG1p?=
 =?utf-8?B?OStKaXkwVlZQUE0yWU5LdithdVk0ZjlPOWhIV1U1bHVUdzljNHBoVW1ySWlm?=
 =?utf-8?B?QXNWNWV4NVM2WGtlczU4MHJrSWFrTmV4aXR6N3ZKZ2thTE9WbDIxcFQra1FD?=
 =?utf-8?B?aENOWm9kRFNNd0lnaDRhdzd0U0dGL3dFK25jTHFmd0FFVDlHa2tuaWJWcG1r?=
 =?utf-8?B?Q25CdWtQbUx0WnJtekphWlhjSG96UFdwZEJUMW04VjcvUkhPQS9UT2RZWDd4?=
 =?utf-8?B?QjZDK2RaK0FMUFROc0hxTFNnbWt0d0pLTVgxaFhQNTBKTkMwRTl3VngyN2lO?=
 =?utf-8?B?V2FHaDgwcEJwTWR5MmpqNU0vZGFneUFKSTJ3d2xUaC9sejNNZGFtU2R6b1Bu?=
 =?utf-8?B?RkVCMUJTekJIamgrNnNWUmJ0TGhLRm1jbXZGUGhRckZUWkFkUHBTcE96N3Y2?=
 =?utf-8?B?QjJ1Ti9LSTJ4Z0EraFljbnJNSG9xbTZMWVJZbStDNkdPSVRtaFA5OFEyd0pL?=
 =?utf-8?B?dWtvR3Q5Q0krbGFaUlVIeG5uVGpSZGh2QUtNQ1dEblJqTDJXUFBYaWp6OTkx?=
 =?utf-8?B?MC90Tm9adzk3enF4UnVZdlFNak5yaW5ZRXAzS0JOSlo3YXVrWm1oaS9oT3RS?=
 =?utf-8?B?dTA5YklHWXg2V0RwRFBscHNzSEN4L2xJakp2NW1UVTV1VnlPSGk4MXNvTk5J?=
 =?utf-8?B?UFRmMHM3d1ZKVHhXMUIxbElEVU5VTmNIL0MyOHFWK0VaQittWjEvM1AzUmtj?=
 =?utf-8?B?aUJpYW05WCt2cG5JSzVVbzVDaFljQWZmSEFmTHVCOHJNek5YT2w3Q1Vtcno5?=
 =?utf-8?B?ejVrZ2ZTL2VZOUVmZzNJRXhyNGpiSU1QVFVTcEdhT0NtYkFtWVRTQ24xdElH?=
 =?utf-8?B?aXJiM21xYm1vajZzSXpGWXFIc0E5ZWluTVJhaDJJVTJmZUVDaEVuMWJ3ejVx?=
 =?utf-8?B?blJ4R09qUWZQRFNwdTB6V2xsVW1GSHQvQU4xY2FGay9RQlRrc3pTUDE4Q1pJ?=
 =?utf-8?B?TUdwNlprbE44a01NTzdDbDBlZnB1L2s5TFNsQzJubFRNUlhjcVJOYWRnRWc1?=
 =?utf-8?B?MjVWVms3aENVZm9lUUFVV1VFV29lSVVueXlaNU1pYTJMUFNrOU5rNkxpSGcx?=
 =?utf-8?B?bDAxbHo4RDlpdWhJeFJzdGk4YjQrbmNBa3l0RnZJSWJ3bHBOVnNFM0s5a0Iw?=
 =?utf-8?B?NzhwSHFINmpSemJxc29iQnNmNmswdmhHaTZFZFFKbENRYVVxMVROWHN0d3lE?=
 =?utf-8?B?cVVzZU5ZNUR4NXIrbk85UG9yV0dzMFBkaWI3YkNHTmNPS0pEMmtVdUtrSDcz?=
 =?utf-8?B?SG9VeXZHYlNPMW1QTEk1WC9yc1RmR2JKNFF2Wmx1Z21PSnd0SStLSjVMZ1Zh?=
 =?utf-8?B?Zld1NnZFZnMwelE3SWo5MXBsc0lvcEJ5UlFmZTJFM3BmTnppWTNHUmdQem14?=
 =?utf-8?B?eGVXaGZjOUUxQTJOK09MUWJLQXEzTlhnbXBqajBucFV0RWIrSmM5b2UvNVVT?=
 =?utf-8?B?MzdJZi9xakQ0cys5Wld3S2J1N3hWNkVEWlhNb0FoekVZQk5WR2hNVGM3dFFQ?=
 =?utf-8?B?OXlsWGZDUjdNV2JYdHRqZTQzUE5vWjNvMjY3RHkwdzRrR0dWN1kzZkt6djA1?=
 =?utf-8?B?V1gwbU9kWG5LWnlwRmFxalJncHJZR1R2bS93WGthdUJSaGozZjJGYmtuajZ4?=
 =?utf-8?B?TFFhZjJDblBUUE1IUUc1VlpTbmFETjgxWnhNU1FFeVgwRHlnQ2NSTlhmRXd6?=
 =?utf-8?B?SnVDSnlsaGp0Y0gySzJDemIzZFVyaEZ3NlZwRHhvcTJGaHRveVpHVzU3MEVM?=
 =?utf-8?B?d2JhRXZKQUZVL0lmMk9xdFYrZUlwL2dnem1saGpLOTFNVnRIUDlmZ29iN3Ay?=
 =?utf-8?B?MFBoall6RkVXYWgrVVpkc2F1RmpSc3JaSjV3NVJyaWdDV1NIZDJYaStzUWxk?=
 =?utf-8?B?eEs0eDRBWEVvei9ULzBnT2I2RUFORkFubFBUdVhxY21LRTJmWHZ0UTRHRUli?=
 =?utf-8?B?UzJVOFQ4Vm5vWDB4R1E3Q3pFcTk0VUdYVk92eVdEZlczbmN3eXNpSDhlc0FJ?=
 =?utf-8?B?VVNtTkFWbHNrSzl2aGM1U3RKam01U0hlS2tXWGVuZy9vc1lHWXB4ODEvUS9R?=
 =?utf-8?B?OG9nUzRaSVhTOS9rcThQTEh0MUplU1FMRnZxRFZSTTFzb3FFaE9VenNFdjNU?=
 =?utf-8?B?cVlObUlmaVA1TUVHR29TSFBKY2JFbmxQdHMwQVBZVFVja0xpOTR6ZFpEVFBs?=
 =?utf-8?B?MEF1dGZiM0Q3a3hJWGtiL0hkbmZERGN6aFhlbzdnVm9xdE5EM09laWt6NmND?=
 =?utf-8?Q?bWib5iZmQchRLjHo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60d17e81-ec90-4a31-599f-08de48e0ca22
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 02:52:23.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O1NE1wW+lgM2f8TDAZRpq3uDODKGb2xFp7HJOSlLaDi2C6rBDkFiuBIRnQYdnbSuJKh7SltJJHq+/VOJev+/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
Message-ID-Hash: UX6URWVHDBJRKB6LFPLKF6OZ37PYVNBH
X-Message-ID-Hash: UX6URWVHDBJRKB6LFPLKF6OZ37PYVNBH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UX6URWVHDBJRKB6LFPLKF6OZ37PYVNBH/>
Archived-At: 
 <https://lore.freedesktop.org/d1a8fab7-f405-4b4e-84f9-8057c25c5ee3@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/31/25 6:42 PM, Joel Fernandes wrote:
> On 12/31/2025 7:46 PM, John Hubbard wrote:
>> On 12/31/25 4:15 PM, Joel Fernandes wrote:
>>>> On Dec 31, 2025, at 5:47 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>>>
>>>> ﻿On 12/31/25 2:33 PM, Timur Tabi wrote:
>>>>>> On Wed, 2025-12-31 at 13:47 -0800, John Hubbard wrote:
>>>>>> The builder-pattern setters (self -> Self) enabled method chaining like:
>>>>>>
>>>>>>      reg.set_foo(x).set_sec(y).write(bar);
>>>>>>
>>>>>> This made separate operations appear as a single expression, obscuring
>>>>>> that each setter is a distinct mutation.
>>>>>
>>>>> So you're concerned about the fact that the compiler is not merging the set_foo(x) and the
>>>>> set_sec(y) into a single read-modify-write?
>>>>
>>>> No, I don't care about that aspect.
>>>>
>>>>>
>>>>>> These setters are infallible,
>>>>>> so the chaining provides no error-propagation benefit—it just obscures
>>>>>> what are simple, independent assignments.
>>>>>>
>>>>>> Change the bitfield!() macro to generate `&mut self` setters, so each
>>>>>> operation is a distinct statement:
>>>>>>
>>>>>>      reg.set_foo(x);
>>>>>>      reg.set_sec(y);
>>>>>>      reg.write(bar);
>>>>>
>>>>> Are you sure about this?  It just seems like you're throwing out a neat little feature of Rust and
>>>>> replacing it with something that's very C-like.  This breaks compatible with all users of the regs
>>>>> macros.  Seems really disruptive for what seems to me like a cosmetic change.
>>>>>
>>>>
>>>> It's only a neat feature if it *does* something. In this case, it *looks*
>>>> like a neat Rust feature, but under the covers it really is just handing
>>>> around copies unnecessarily, when really, it *is* doing the C-like thing
>>>> in the end.
>>>>
>>>> I object to the fake Rust-ness that's being done here. It's like putting
>>>> hubcabs on a car.
>>>
>>> But IMO there is only one operation here, the IO write. The setter is just mutations. Builder pattern chaining is idiomatic to Rust.
>>>
>>> I would not call it fake Rustness since it is Rustness in the Rust language. Afair, similar arguments were made before and conclusion was, well, this is Rust.
>>
>> There is nothing about doing sequential .set_foo() calls that goes against
>> Rust idioms.
> 
> Huh, I just meant we should "Ok" with and inclined to be using Rust idioms even
> though they may seem unfamiliar at first.
> 
>>
>> But this really is fake chaining, because there are no Results involved.
>> It's not buying us anything except a bit of indirection and cognitive
>> load for the reader.
> 
> Chaining is not really only about error propagation. Builder pattern can be used
> for other cases too, like passing a setter chained expression to a function
> argument for better clarity, I was planning to do that for the sequencer for
> instance since there's a lot of parameters passed to it.

Let's see if that has any use for this.

So far, though, in the code base that we have today, there is absolutely
zero benefit. The diffs here prove it.


> 
> But in this case, I am actually absolutely opposed against this, it makes the
> API hard to use because now how do you differentiate between an IO function call
> versus something that just mutates memory? Is set() an IO or write()?

That's a completely separate, pre-existing issue with the API.

> 
>       reg.set_foo(x);   // no IO
>       reg.set_sec(y);
>       reg.write(bar);   // IO.
> 
> So no thank you, I quite dislike it. :)
> 
> Instead with chaining, we can just rely on the last part of the chain concluding
> in a write() with the intermediaries just mutating memory.

Same as above, just a more happy-happy chaining interface, but the same
function calls must be made in the same order.

The main benefit of chaining is really in the Result's that allow
an early return from the whole thing. If one is not using that, the
benefits drop sharply off.

> 
> Further, your suggestion could also make it easier to introduce bugs?
> 
>       reg.set_foo(x);
>       reg.write(bar);
>       reg.set_sec(y);
> 
> While this is also possible to mess up with the register macro, it is much
> harder to do with chaining since there is no opportunity to interleave a write()
> incorrectly.
> 
>>> Regarding the copies, I am intrigued - have you verified that the code generation actually results in copies? I would be surprised if the compiler did not optimize.
>>
>>
>> No no, I just mean conceptually using Copy instead of a mutable Self.
>>
> 
> Conceptually, but the compiler would not do any copies through the setter chain
> was my point though. Note that all setters are #[inline(always)], the compiler

No argument about the actual copies. My point here is about the API and
how we use it and understand it.


thanks,
-- 
John Hubbard

