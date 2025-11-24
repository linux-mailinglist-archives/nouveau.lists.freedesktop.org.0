Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CDC82E44
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 00:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD8010E27D;
	Mon, 24 Nov 2025 23:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FfEAriTb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6EC10E27D;
 Mon, 24 Nov 2025 23:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZSnBLv4zX7FMimijzW3JFJjvo2ItyaFyZXywSYIPFmGMluYcu2Xiuv0ei9qlK8+xq7s+bueuRiXF8hm2VRo093H4ch2GehnpqqpHS6azlPnvBGu5pNQiF2qG0plCr7aM5rb3jrnmxTiXJeHd3ylV2Wd8gXZxOJuo5D2ZLOCrqLVM7IUqqDSUDZ9nqKcJQe5OjQBQzxDQk7f7PM/4bFMmqUrbPuevWE6Pbi7qK0WZSGiz23cEMd6ZSwim6TBjNQIIuBBQGZrcMJabcPDcYLNsmr1hHkIDNb7eR9f78HF2sKiELAYkUkC9DVUHSwr4kABg1/8d2wv918worhZjR26xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irSZ7feL9vDfVzN6gtMoZ4MND6u23awhBqKVZ7DOuPI=;
 b=XcM2Qst+g4yqRsjVZjquGwfuX8DGYnwazqqZhqvcY1Valoac7WYJju2qfYG/fNHZjCsKUnmexkCj2oUk8GkqOs+fJP5TnlrYxZMDP31IY9x6pLkNxkwiuCER5CCZT/Dx61ofCGd7AYp82mpwKzhFlXrRfhTsMCAshDfVOyk5e4WJizPcdI5mGX7yCJpIaXzD4/kiMiyfgy2UqZ/1/quh+A79IjkmaXU2tIwx7suZB/ay/ItgRDLQP9Y6NbDBogWFUGh993uc+pH9FxqgiChDmX9W+RpwM8JYjGzcwLOcTvSJ5KGp1Ng23L6Vhw5NRqWAI8A7tybBpkJNuHFXrccrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irSZ7feL9vDfVzN6gtMoZ4MND6u23awhBqKVZ7DOuPI=;
 b=FfEAriTbv4LjtciwPMVSlhQejGXbfc+ltwDwtnQcSQDfaQXESCeHVcFMdJ9AEMtS9JrWc4srLcJa6Iy37AI/tJG+9HxMImzXjN2RhzKvwArN91tD4mta+9W98Zohn9EVVJAoym6jnz4jQJrPNUAApRBDhgcemk4JksQdNxjRZJ2HTyqtBc0m8pjGb2Xt3JVhmV2jcum5WKbJuSoRIWwqaOx3VDb45eVPYIbThFq2OU5i+O0IoGC+EulEomvRwv8MvnPB8z2Z/Zp8SyOfbaibVkTSEdhiptQgiwELTJeGdSz0QNv+T2LnkEJ/qfomTRsawa5k6a5Crxi0hPtBF4ajaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:54:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:54:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 08:54:20 +0900
Message-Id: <DEHBWF3FJFHG.1DO4UJ0RE7SK5@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <DECH9WO4EGMP.24N37TGWZV4NL@nvidia.com>
 <8026f53d6685374bfc086621326e9d7c52009d4c.camel@nvidia.com>
In-Reply-To: <8026f53d6685374bfc086621326e9d7c52009d4c.camel@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 992e36df-34d6-4fd8-80e5-08de2bb4caf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amJCU0VoN3M1QjBZd2pXY2xXWGxjc3d4a3hRQ3dzR3dWL2l1NWpHRFVRRVRX?=
 =?utf-8?B?RUNxUHpuMVNWQ3hxSXRpdnVMbjlNWnlzWmNFOFFYaWJFM3pHL0xFSFpEbzZm?=
 =?utf-8?B?VDdDZ01nK2Z4L3JEbHZNSjlOQkJJc0hiWGMrWERES1FNc0NKMHRtem1ma3h6?=
 =?utf-8?B?T2F6RThiK1VZdW5iSW5mOXV4TzArblk4VmRJZDhUYzNMRVFQeWhyZFVNdmhL?=
 =?utf-8?B?VEtwamhpTUNVaVB3Y1dGSTg3Zm9NOFdlcXRsNFRudXN2SVlZWjZ0Z2d2RVZ5?=
 =?utf-8?B?Vzkzc3dQaU90VlFhbWN2b2pNZ2NXZitlSG8vaEFzU2pFVisxNWdjZ2V1eGk5?=
 =?utf-8?B?UHg4ZWFzcnAzUzh3MG1yWUFZaFZ1MFRDU3ZEeElVL1hUQW1uNVJjdWJ6cGE5?=
 =?utf-8?B?K2JDemNrSzh1ckNwb0xoNG9lRkJPeml4bHIvQlQ5c0tGNmJxMmpIZVNkcjVl?=
 =?utf-8?B?R0Q5M2wyT3A5c3hQL3ltOXJTTEJaVHFjUElYMVRUZXRmREQ0ZGNZTDJPY2NM?=
 =?utf-8?B?NGlrYlFWVWVkY0QrdVEzcWphc3RqdGpWYmZiZzRKaWZITlplV0JEUjc2TXFu?=
 =?utf-8?B?OGI0d3BRQms3YkM1aHdmRVhBajJabGhFRUt3Y1QxcWZEZFlIMDlZQXQvSHJE?=
 =?utf-8?B?N204UHlSQVpKRU0zTjlDVHI0Q1lnU2NxVExqQUhjZVZYWTVVdFNXbWxYTkJm?=
 =?utf-8?B?ZkU3b2Fjam1TR3ozK1pld29sVk9KVENjMyt4ZmRMZ2xPbXRVeGxWcS9iS0sw?=
 =?utf-8?B?MUVzNmhKaWZDRkdsOUZwbFNoZ2dBUE1FNEZkN0s3RzRhUmFVdlFqT1dRbDJK?=
 =?utf-8?B?Q3NsRi9YeHBlNHRzTXFZaktCazJ6d0Y5NGNObUhZNlVyU21NbmlMd2ErWDVJ?=
 =?utf-8?B?V0JNRysvTVN0a05uZDUwWURTWnNpS2FnRGZ6WG5ZY3M0MSt3RTlPdVV1U2pa?=
 =?utf-8?B?Z2pOS0tVdzBYZVFhZEdMMmFqYUQ3V0RKQ3U3cGhSQ1hoRTEyenpiYXFwVFZM?=
 =?utf-8?B?RDNGZ0ZtRXpvMTlEWkRNbW04WDFlQ1BEdXhKQ1BTbXRuOE1pSjFCRFVsa2NQ?=
 =?utf-8?B?NWY4SUJKYzQwWUduNXlpYkVITkxtS0o5U2J3ZXVmYTRBR0I1SzNqblp2YTQr?=
 =?utf-8?B?YW1TRWlKYndFcGVhcllvVU1ZNmFjM0hoanlVb0didUVJa2xFdDNvblBjcmk4?=
 =?utf-8?B?MXE4RUMrb2xWaHd6U3Z3ZXlYbFlHdXZKM1RkVC8wQXdiamNzdi85amczSzdO?=
 =?utf-8?B?UEdDZ3pyS2ZPTlJhVW9UYnJNZ1lZK010NERTaW1qNkZFWlV5bnRqNnUyUC8r?=
 =?utf-8?B?VURQNVZ2THFBcmF5TW1QZXMybndPZmkrTVhBRHdsVVdZcTlLOUtZcDlLM3BY?=
 =?utf-8?B?a21SeTlLUTZsb3V5bHlJTko1TG16ZzVpQVVRZXo1OXpvdEYxQUxmbmxjTzlo?=
 =?utf-8?B?cGxYQmdKM0p4c3kvUndhaDQ5WUVGZXRBOW9VVTQ2dUkzZk1hREw2YlN4Z3dj?=
 =?utf-8?B?MVVMODZ0YjYxRkxJMEtpRmtsTWo3TGZFSm9MNXZwcGhFdTM3NitUZnRTZm43?=
 =?utf-8?B?S1dnTythTGUwcmFGSXhHWDZ6WlliejRaSHZwSUx3REVwd0xtN3dkbmhTZzRG?=
 =?utf-8?B?WGNSbUlsL1dUUGdtMkpMOGJXbFFZSWM1TW9PTFBXZ0g3TVEvbXB1NExCQXE4?=
 =?utf-8?B?UHo0cERQMmliUnlQamhHVFpZaDIyeEVVNEJyQS9NTTNGNG9NZ1UzUEhEVU85?=
 =?utf-8?B?LzU4NEpuNDJNZ2cvemlXdllCalA1SmY1K3NodlhWWWJ1VEwxQUU5UEpYTUNR?=
 =?utf-8?B?RmI3Y2hJWXlEOFozUnRXT0F6aUdGRGFjQXdWalJjNXpTY3FuZXF6a3JpSTJn?=
 =?utf-8?B?SmFDYjNKZk03WFRkc0YwajFxVEdITmI0cnArM216dEJZc0o4cncreFdzeVl6?=
 =?utf-8?Q?oGWdWbMJf2j540E126yydQr0AXFr50wh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdORjIzV0pNaWx5MFJycTZHemdUMG9lbUY3Z09MWEVrVThpMTZSeERLODl6?=
 =?utf-8?B?cTE0bjh0ak1mMzd6YVIwdjV5SklDY2dBQUkvRUFsS3VzSDcxRTR0dDAzM05C?=
 =?utf-8?B?NWlHOXgvV3RFYkpHc3l3UTB1dTZ5b0FKaWZEUGNiRFB6cnp5WDdoR0lZdi9x?=
 =?utf-8?B?NDYxRlhZUi9CU3Z5OStLSHZIR1ZXLzduV1ZRU3RFZHhUSFljTzE5bWhudlRz?=
 =?utf-8?B?UGNIbDd0bkRjS1Z0bE5URVdSeWZrRFkvU25iamdMcGZtYVh4dUVFTTF2MW1N?=
 =?utf-8?B?L295RDg2cTQwVkxVZkFqTjJ1aGJEb3UwSGk2MDNMNElKRkJjR3Nad1NySTZo?=
 =?utf-8?B?ZGVFZXZGNVFJUmVKKzhuN1QrN2MraXdTK0xJai9lYWN3WUpZTXZWbVZqaU1n?=
 =?utf-8?B?SmZYSmsxYkcxRWdzOTR2cG1BQXVsZUpFRFQ5UGpUcHEvbEVZOFJhcWxUZm1w?=
 =?utf-8?B?dldLZDBXWU11ZFJFR0k0Ui9FbjRrSGZuVmlnWHUvR1pWM0VCN3pKY1BRMXlT?=
 =?utf-8?B?T1pmT3BCZ092MGZVR2FBTFliTlBQL3l3K2Z1WDZBNStpaU5OTTIwV2RpNEhh?=
 =?utf-8?B?dnBQM1MzZGY3alZnR3RFQUVVOTVlQzI5VDlndGJaMm1waHdTQUFFejFsR2RD?=
 =?utf-8?B?WXhpeG1uZ2VQMjNVS01oTDN0cG9sNmNyU1I4NCtQcmlLRWJuaHNYcDB0L29q?=
 =?utf-8?B?a2ZVL0xxK0xHdXE0cmxCcXhuODd6ck5FeTdwR1BTSThRWkdjN2tsdU1DL0xH?=
 =?utf-8?B?dmpwcXBYMVVKckwxV2JGSUgrNFduT2M2UEYzcUpFVTBZMndNWFpmZXNCTUxD?=
 =?utf-8?B?RHJVTU00WWpLMlBNa0FHYXBGMlQ0eENwOVpjaS9tRmt3elVNQjkxY2lmYXJ0?=
 =?utf-8?B?NnFUR3BpcmpTUXNHQUxkY29Qd2F1aEM4bi9QU2FnRFFXdThxbmZkQ2ZxQXFT?=
 =?utf-8?B?ZHZWdzkrdjN1NGJLWjNwc1plS2lMQVlpQ1A5VDgyQXFveVFSSG1OV2l1N1dn?=
 =?utf-8?B?K0J3UHdJajdnUk1HdTEwYmdOUUlnai9qMmZWNXZURXhsWEdNVklaZmk5Smcv?=
 =?utf-8?B?RTc5ZHVMWHZuWnpwbkl4a2x6bGZhcnVObTZYaEFkY0dyNUI1algxZk5ITnFt?=
 =?utf-8?B?Wmo4a3l4dVhuY0Y4QkNXUDV1bno4cThTMEVZL0ttZ0xsY3FuQStzS2NiNDVN?=
 =?utf-8?B?d0RoYXd2WEpOamlkbk13elIxUlJva20rdTAzMklGT3NkbURHWEdRdDVIOWxx?=
 =?utf-8?B?cVgxYmVQbndvTzd5eXNuTGYveUhzZzZQRWRBMUlaelJmbS80bWFqRjJ4Zk1l?=
 =?utf-8?B?SzdvOWVwM0FZMDlyTnhoa1pONUIvcUIvRFc3RUEwakVkNUNNQUhteWdJUVI2?=
 =?utf-8?B?eXI1SUlWdllZUVJNVmVHdEVwMFlhMmhFbk1TVTdwdzRubCt3ckxYa1pMbHR3?=
 =?utf-8?B?RlozOEFxSzUzalJ2bkx5QzR3R2NwTTJDUGNKVERkNXJ0cWw4Rkt1Y0RQdGln?=
 =?utf-8?B?NnJhb3hzaU9uT2w5UmdsbktlV0V2cFJCTStLN21Dd2ZwbG9kcnIxd3p0UXR1?=
 =?utf-8?B?KzVoUlZ6c0hWWUpVeG9vQnhDTmQzR1Ztc0JYL0VXVk1UbzhqUC9mT1hnUmJD?=
 =?utf-8?B?ZUVHbUJ0bmZoUVkyd0xqVTJGLysrQ0xpNjBCSUxxaUdMVEVyRzQ0cTFMbkZp?=
 =?utf-8?B?UTJpVXlCN1FJYk5ldFdXRHFZR3dZVy9pQmR2NkZ0dzlFejlMRVFFUUZOM2Vh?=
 =?utf-8?B?dm9HQ1FGZ0FsZ2VVVFNNb1JlcjBGNTJtVXZpOGxRZHNPQkVsemxndFRySEpI?=
 =?utf-8?B?S1NDQ3M1Ni9vNTNYVWtUZk5CUTdUWi9MSTgzaE44UVJEQ3pKdWphM0hKVkg2?=
 =?utf-8?B?R2ExWlRoZ2tldFNzLzFIUWNENFJTL2k1UmlCY1NBS0J1dzkwSDJEVDk3MFJV?=
 =?utf-8?B?enNoQlJWMUJzUndTWnV1ZFFCSnNOOEcwMzkxWVE2a0FWSnFiMytsd2lPZGdM?=
 =?utf-8?B?U3RFME1rU3VNcTc5U1kyZUo3cFNkdGRHUTQ1NVA0RXJGbG9SOUpoMkFEMFFD?=
 =?utf-8?B?Tm9BZW5ObTFVS3g0OUt1b3VmMGxSME5FSTU0Y0pGSlhXdWU5SnlFNVdMNnRk?=
 =?utf-8?B?WHlzSzBvOHlIVWV5WVAxYS85MFNqU0hTYnRGYU9XZFYzcHlEU1VONTRkcHF5?=
 =?utf-8?Q?0kMu9XJuMvomcgjhHuXcVS6uV4T4X1Rcg2CG1gRjQMBm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992e36df-34d6-4fd8-80e5-08de2bb4caf7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:54:23.6773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jms6oVhWVIINpvsI22NG11PXdRNtZYc7cG3M+DNrhi+78F+q8dh9wILqx9a7qifbrghms5MoCjveolyYJ8PYiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404
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

On Tue Nov 25, 2025 at 8:24 AM JST, Timur Tabi wrote:
> On Wed, 2025-11-19 at 16:03 +0900, Alexandre Courbot wrote:
>> If it comes down to "This is how things are pre and post GA102" (and the
>> evidence I have seen to far suggests that unfortunately), then so be it
>> - we at the very least encode this as a method of `Chipset` to avoid
>> hardcoding chipset versions in several places.
>
> I could add this method to Chipset:
>
>     pub(crate) fn supports_dma(&self) -> bool {
> 	*self > Self::GA100
>     }
>
> But shouldn't this be added to the HAL instead?

Agreed, that's a better place for that.

>
> There are a few things that are arbitrarily conditional:
>
> 1) whether to use PIO or DMA to transfer firmware images to Falcons

As you said this one could be abstracted in the falcon HAL, by having a
(public) load method that calls back into the (now private) DMA or PIO
methods of `falcon.rs`.

> 2) whether a Generic Bootloader is needed for load FWSEC

I suspect this one is correlated to the FWSEC header version? But maybe
I am just seeing patterns.

> 3) whether a Non-Secure IMEM section exists

This is the one that gives us headaches currently...

> 4) what the name of the signature section in the GSP-RM ELF image is

This one is appropriately dealt with with the match statement in the
code - after all, these ARE dependent on the chipset.

>
> If I'm reading it right, booter.rs currently has no concept of a HAL, whi=
ch is why I gated on
> Chipset.  I agree that doing stuff like
>
>                 FalconLoadTarget {
>                     src_start: app0.offset,
>                     dst_start: if chipset > Chipset::GA100 { 0 } else { a=
pp0.offset },
>                     len: app0.len,
>                 },

`booter.rs` won't have a HAL because it is not a hardware part. So worst
case, if there is really nothing better, relying on the chipset is
acceptable as this is just how the firmware is designed.

>
> is not ideal.  To be honest, it's hard to wrap my head around all of thes=
e offsets.  I'm convinced
> that most of the confusion is the result of RM developers trying to shoeh=
orn complex firmware images
> into legacy file formats.  Just looking at the above:
>
> On Turing, the secure IMEM image is copied from app0.offset in the file t=
o -> app0.offset (256) in
> IMEM.
> On Ampere, the secure IMEM image is copied from app0.offset in the file t=
o -> 0 in IMEM.
>
> Why? Apparently, because on Ampere we copy the Secure image to offset 0 a=
nd ignore the Non-Secure
> image.  On Turing, we copy the Non-Secure image to offset 0 and copy the =
Secure image to offset 256.
> It would have been much easier to copy the Secure image to 256 on Ampere =
also, but that's just not
> what happens.
>
> For some reason, os_code_offset and os_code_size contain the same values =
on both Turing and Ampere,
> but those values are used only on Turing to hold the Non-Secure section. =
 So the firmware image
> headers say that there's a non-secure IMEM section on Ampere, but it's a =
lie.

Yup, I was hoping that we could discriminate between the two using the
size of the non-secure image (which I expected to be zero on Ampere+),
but ... no. :')

Now with moving the loading abstraction to the HAL, I guess that would
leave only `booter.rs` as the place where we need to match on the
chipset "because that's the way it is". If that's the case, let's not
spend too much time looking for patterns that don't exist, a comment
explaining the situation will do and we can try and fix this in future
firmware versions.

Thanks for looking into it!
