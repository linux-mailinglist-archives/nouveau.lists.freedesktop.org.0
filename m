Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D710FC82F60
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 01:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01C310E285;
	Tue, 25 Nov 2025 00:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ego0icfw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010050.outbound.protection.outlook.com
 [52.101.193.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27CA10E285;
 Tue, 25 Nov 2025 00:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWpSHVukbSzVwJLDeRjGeRgDRTlggy48l/qih3hZjkfpNSmvWpSjVTqXEMynD2xvkh3/s+hrETKDyy4ZNzIuoYZbUdwKCRHwKY2DThVNjt6vWeYwTChwZJAObyc8NqdTdVkum1L3enITvgJpBxeSJwmrmDB6rSZoIrNcGojZWqFCqL8o7W31vD1YwqyJ5ut9DnVKV885/IjEt0998yzmCpFgOPdxLom74iVJzcV078ZdfYHm9GMbNyc0/zePVxlOc6ZF5GaCm7RItggcG5jDq5bfRDnb4wsELxk/yQknB6fT0mCZJLVOc1G1L366O7RBkiX9AI7OP0gS7+/xwcaGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE6cV6fFFQt7LmnzAfIrKKJGNpCO/Ksu+B6neg8QZr0=;
 b=GYCcbWwWFPD6JZQja4oS9xJHa/qQxSHHaLqlXCzuF/bbQ99SkRJ5mdfCTZE0gspL2e66KYYnr17VpOx8lr35tluJJ5ckTMpaf2CPLuhWJ7ASh8DGBG5jkK0KJqP1vryh7szflXcqV4mAUnxx8N+lmbsrmmXqeTF6OIspQSSN72U6KDDyEEDV2thX03ENyWM95o7JZP/HBg7TMegBtXo/B4+XsakgMROrFoxpm3eNK+sowrtG7lQbEUO+BfOxO45j/eusg1YY0cLRrk09QoLffzV9PyaaXGxIgNNyO9BPJPGrDQe+FZ/wmN6zYeux6fwIaJ5moNG0yH41EOE88Szc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE6cV6fFFQt7LmnzAfIrKKJGNpCO/Ksu+B6neg8QZr0=;
 b=ego0icfwRp6tzqWfk+F//Z0fINN1O65YX2m14viu3a1UhukZB+kjKrIPzr/ChoT9dNE14+ZakSFUdehCVpTK2vXKj2qTF/W+C9wrcqtmpAFSodNar1YfV9Kfo/ux/P0uhssTefmoKGWuW7r+yA97rDQzxcTF2mgfrreEfq82P6vLljEvb3XkVwHsR1Vwn+nQab2o2frmp5tcplFiS7bqFoNi5v8o3AOmgIaaq/3m81z6Gp5G4CuRQKv3w1bQUGPPhzceFa8i8m990wJ9+fJKXZEAuoMl+0otZJT/7QDNayGHQ5Bc6w4povGfuwFXDM3Ltrz2x/LyE0fqUAXlfRbwHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 00:57:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 00:57:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 09:57:21 +0900
Message-Id: <DEHD8O2SS763.2YWSUIA9JICGN@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
 <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
 <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
 <569b40c6-c234-437e-a894-fd3dbe9669a7@nvidia.com>
In-Reply-To: <569b40c6-c234-437e-a894-fd3dbe9669a7@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c897863-f29d-4d25-619d-08de2bbd9884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTY4d3NPbFR0dXNSbEhPdDRTMlJYakM0SXQvOHNGbWdHSk5BNmVLZFhBMWc5?=
 =?utf-8?B?a1pmNTRlWHJMcVlYbjFEQ0FpWS9wMHJZenhsUTZsS3BOVlpxYTlOVnVHNkpB?=
 =?utf-8?B?eHBybHlzek92QU1CL3ZsM0RDV05vTG1ZK2ZNaTVoL08rOWM4bGlGb3o2NEk3?=
 =?utf-8?B?KzFldnVFOGpMQVJYbVFLOGVJdUNTL3kyRHpzbkk2VW53VVJlM2tWQ0p5aFhz?=
 =?utf-8?B?ODFYMkYxTTNhbG11NWhPQ2ZIWTFFNWRLaTVCaUF0emVSaDBzUWJYNUNxdEZW?=
 =?utf-8?B?Uk44ZkM4WTBISGVOYlZkUTBOMVA3cjhjYU5DZHM5eHJMV0RIU2x4YXhsQ0Zk?=
 =?utf-8?B?Q3gvRm4yWFZmbmZKUTl3VVpISy9iWEZHbWVjdDU3eTBQSlNEZnJYRG5VaTc4?=
 =?utf-8?B?WnBLdTEvaTJEYWdpc3J2WnJyRTMzZVdlVWV3TS9BS1VwM2ZRaUFhRWVyS2tt?=
 =?utf-8?B?Zld2WjZ5OFBxWjNnbERQamhIQWpNSitwOE14QXM0b3d5YzlGNXFVU2k4VlZw?=
 =?utf-8?B?ZlNtdyt2dUdYNDdnSDRxTDdIVnN2YzFyZkUzS1BJVDU1aktOUkFzUGFLZlRW?=
 =?utf-8?B?dU40YVNWRHZuRVkzeXVpZ05ISk05dEEyTlEyVFNqQkNCQnhzS1pRQlh1d0RY?=
 =?utf-8?B?ZWpKbkdMTHhicHhIT3VZQmJ4NENiSkxDU3BvZkxRQ1drbjUwb09JL0J1RFpy?=
 =?utf-8?B?eEtBK05vVlRqMnFsTDBqY0hrWU52QXRsbCtBbkFPK3ZKU3hNOWs0ZTJIUEpN?=
 =?utf-8?B?WHZSblBGdzF5NTAxMEVPT0Vrak9sK3AwRHJVbWY0VHB6NlBQOTNRU0FXL08x?=
 =?utf-8?B?VThWZ2Qrc0JNZHllTm51R1BCZWJUaEcxWlpzaWtLWFBrei9BNGhlSWlablB3?=
 =?utf-8?B?Z2c5YjNvMXRVMEVwb0NVNk04S3BvODFYa3o4T2E1M2d5eHhJSnBQZTBUYktp?=
 =?utf-8?B?b0ZVRlBGMm1vM0YrS3N1eXcyWFNtRDNaSTFzWXZMSEVPbWRGbVIrQnRyOGdk?=
 =?utf-8?B?MkhlaENHY243V0s5ZGRMRGhJOFdlcWs0VjRNUTkwK29ldUdqTG96bkVPT0wz?=
 =?utf-8?B?bkkrdUY1b2QwYytacmR2Z21PLzMwczdSOElTSGpnaUNrWXZpU2NlbU45bkUr?=
 =?utf-8?B?MEk1TXlDWWV0NnVOMHZBaXZ2TDhhOHpZbEdGQWhZZDRHL3JwTk1qRlFiVE5z?=
 =?utf-8?B?djRuRG1tb3NPU3BqcFNjMU8wQU0vVkxHYVF5V2c3bFdnbXVKOWR1R3BucUN3?=
 =?utf-8?B?V3N4ZFdIZEZpOVpraVNUdHZkZHpKYjBLYUI3bWEwdVE4MDBhRUY3ZS9NZTg5?=
 =?utf-8?B?aWU5Z2VLUEpiL2p5a3RsTGFnWU5jRTh5ZlkvRTJoejhSRWVFUGdYL1VBcEJT?=
 =?utf-8?B?Njd6YmxWQlpKSU5Sai9RUW1UcXM1L0Z6Qlp1dnJ1blJNejhMUGg3Q3JOb0NP?=
 =?utf-8?B?NTFLYTg2UkNzclFoNHR1Z25yNFFUVHBEZXMwVllqaVpzM3FnTXdscGp2MGtF?=
 =?utf-8?B?VTZvczV4eUdRZHlFOTZGUmt5ZWRwY1EyZkR4VGJsQ0lkUk5JRkJ1N2V4WVhW?=
 =?utf-8?B?VkUyS2JVV2xqNlFmcS9TdkM0TW1jS0kvM2V0ZVdidEJPc3NmQlhVQ2xlZ1JT?=
 =?utf-8?B?V051K3hISkNhU0pPQktzMTJxbDd3ZFU0azZVbDB2dUZUaDlyRkhTV0FKUGFH?=
 =?utf-8?B?czFmMHVHZTFFaWtoUVFBOGZZM0Q3bENUZmVnejFXTjI4L0doQmZTZGJLa2ls?=
 =?utf-8?B?VmZNMDUzc0d3R3NsZjlSS3lKSU5JZFpmbTU4NFhsTHpFV0c0UUIrcXcxbXBU?=
 =?utf-8?B?M2J6SGk5dWJJTVNVeEhMYU5HNklIYkxsQWZ3M0hYTS9idXBEcjJLcmxUdHlT?=
 =?utf-8?B?bXZYbVpEeDNrODBDVFNjZklpVnlITXlVbkM5VjEvbVFFN21jdTh1dWVBN0ov?=
 =?utf-8?Q?MUDld8jRQk7JWPKZmAAEKObu6PuvHmB2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q29NVDR5K2hsUitlQnI0djJvSUh6b0hFanZOMitDMUM5TU96VDB1TEkrV0Z2?=
 =?utf-8?B?Z0t6NTlaeXpKeWpwODNlNS9qM2dKajBaVEFzbkFWa2tSQWZGUWh4ZWxwQTBw?=
 =?utf-8?B?aExSZ2NwQWMrOGNkZWhvb0VCTk0vNXBBTnJKVWswVDYvUE5yalhnZk5ycmtM?=
 =?utf-8?B?MWY1cTE2eElZK0t0ZDFQZWhwRXh3NERwcG8zZlI4djN1ZUpaWUE3RzRmQUIr?=
 =?utf-8?B?M0J1bjVNd1JUcHkxdHhuSFRCQ3lrUU9GclpRaEdIUlVkZ2V2V1JCOWFCTHlh?=
 =?utf-8?B?TEh0RFpnT0J2MmxzcTZwZldRd3JEZGtkME1naE5lZVhJay9aNWx2ZGxBbE00?=
 =?utf-8?B?UFRobXlVOFRWa3Vxa3FWMlRCMUMzVmhNbzUyK3hONVpxS0NOZFZVcDVmb3FI?=
 =?utf-8?B?MW5vMGIybnFManQxUERydW5rbTlCWVBVclRncXNIZmFqWlNnZ2JCWnZaVHpI?=
 =?utf-8?B?a3R5bFhDQlRYelcvU3M3NHNGNDBJN1ZpZVI0V0xMSXB6T09mbDlxL1JDTVhG?=
 =?utf-8?B?WWEyMkZGS1RGekZCemdhbXA0TjFBSVdjd2gyMm5qdFF5dWkzNjV2QzdJR2N5?=
 =?utf-8?B?VDB6QnJnUFQrVC9hWHZtR0lhazRFaHl6cVowSXBxUERtb3ZvTUhvcDkwcHhy?=
 =?utf-8?B?MDRyRnI3eHRyUkQ5ZFp5L1o1OUsrNEpVME1jWXdhRVozditGWURSZ2lYOGN5?=
 =?utf-8?B?MUdoM3EvR2JiZm1VaVhHTE15YjRWRWR2Q3FWNnZCTDhJMm5mQWtLb1ZqU1ZV?=
 =?utf-8?B?RDdtNGtlZlZKa3h1ZkhRNW1aSlc2S29seEl6RXhJbUZWUndsT3o1aEZ4VEhT?=
 =?utf-8?B?cGhJNUsvVWF0dmVNc2wxcWNHZnAyQWg0NVdmUkpiTmdUUUhLNG8yTDF5MkRO?=
 =?utf-8?B?NEJxSllyWU9USER6UmpVS0dUZ3RCRmk5aE1uVDJSa2cxY0xFNXA5dXhhY21X?=
 =?utf-8?B?a085eVRzeTgyc084OGRSSm1Nd1ROUHBXZXByT2E0Vkt0UnNvK0lUbnJ5Mjcz?=
 =?utf-8?B?M1RyRitrWDdGVXh5NENzOCtHT0ptRUlpT1dPOHZkZnRSZmVuYjlVaEtlWHFB?=
 =?utf-8?B?U2JRZ3pOSVNjb3QvTU9OdzJHM09aT2U4anBpUmhpcENOcS9oeFowMlltT1VI?=
 =?utf-8?B?SjczOGwzb2tvYm52dXpwRnBmcDl4TVd6ckdNQXNCN1FuVmNDR1AyYXhpdEFV?=
 =?utf-8?B?ZzNpWSsvazJ6OUtZVjlQVVlZUmNNQTR4NU93bWk1MlFkUlBiZHV5akRrTUJ3?=
 =?utf-8?B?d3RZcEphZVlCaVdxU0NrZ1Uxb0ltZTdxUW1SOE9zYVYxWGRPVVoyK1g3U29T?=
 =?utf-8?B?YlBQa2ErMWJ4N0c0cXNVc0pqb2YyaFdiaTNzOGtBM00vV3RySU1IWGYzOFdn?=
 =?utf-8?B?M3p1UDl1SGVDdjJpQWJBSHI3K1FFRUk4UURRU25LN0x3V2pVQ0Jxek56Nldh?=
 =?utf-8?B?Yi9nRlRkamtNcWQwYmxuaTBxd2ZkemZ4UitMRzE4Ly9sL0wxRDU4UzRaYXVy?=
 =?utf-8?B?UHpia2VyeUhmTlpWMXdzWEY1NnNqVlFXTjhxOWZlcmpNWnkvQkpLTUI5cTZh?=
 =?utf-8?B?azB2c1MreUo3dlFEbmViR0RPMFpqK2NqcFRSbjhBN3RkbHZqbFFUZXRqay80?=
 =?utf-8?B?My9JR0tVMzJ1czdxOVhSalkxUEhNOE1GNFhsN25uRlNHUGpJempFdVdISU1I?=
 =?utf-8?B?N0lyMVJ6UUdCZlBvcE9SUmxkMWZFcHJUUFFLSjdhL05mTER5cGxzeUNxcEpa?=
 =?utf-8?B?czErb3l2aTVqSmN5NW14WWJzKzVBemZLeTVHVlVXYmt3NnpzL2RpZUpqZVdq?=
 =?utf-8?B?alpyNmpUaUQ5SU91VlptZ2VvaktIVHhwUGZDUFhZa2piMWMwNmhYSXdTOWEz?=
 =?utf-8?B?N3ppUElVbFJoRlZIL2oyTGRyM1YweWpGTVJKdGpCbUtpc2o3YllTd2R4eXYz?=
 =?utf-8?B?UW95OGVaZGZTUklIU2FveGU5Ry9yZTRwOHA5VDJ6WmM3azRxVnpmWFZBNnVq?=
 =?utf-8?B?ZDg3N29hZVZNbE92ajVIenJJRG9Ra3pZbTF0eGxZSzVGcjhCS2V3QUw2eUpC?=
 =?utf-8?B?blRiV25sSTUxZm9FRnJsQlRTNHRVRFdhSTV2enZSdlV2Q2szc0Z5OHc1SHR6?=
 =?utf-8?B?Wlg1M2kxWmtJRHMxa1o0R21lZC8zYjkxcGJTcDhXRHpHbUlIOTg4YmdxNVBx?=
 =?utf-8?Q?5sIHSkEefTqGkpq5SwfdrCkJcuOl+H/v3C21JR8g6MMI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c897863-f29d-4d25-619d-08de2bbd9884
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 00:57:24.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtvIQbVM7f72d8CXKiuEW6BfH6EuDr/vtR1aY3vnU70hUTleAm4OuFy/EqcH1GSoUtc3F1SoTUVuR/keCQ6tVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697
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

On Tue Nov 25, 2025 at 8:55 AM JST, John Hubbard wrote:
> On 11/24/25 3:47 PM, Timur Tabi wrote:
>> On Wed, 2025-11-19 at 15:10 -0500, Joel Fernandes wrote:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sec2_falcon.reset(bar)=
?;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if chipset > Chipset::GA100=
 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if booter_loader.flags() =
=3D=3D BooterFlags::Secure {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sec2_falcon.dma_load(bar, &booter_loader)?;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sec2_falcon.pio_load(bar, &booter_loader, None)?;
>>=20
>> The problem with this is that it conflates (Non-)Secure IMEM with using =
PIO/DMA.  I haven't looked
>> at GA100 yet, but it's just coincidence that platforms that have Non-Sec=
ure IMEM sections also don't
>> have (functioning) DMA hardware.
>>=20
>
> Hopper/Blackwell+ use PIO too. So the conflating could be a real
> concern.

Ok, so we really want to have this handled by the falcon HAL as Timur
suggested.
