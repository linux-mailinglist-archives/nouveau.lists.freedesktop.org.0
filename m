Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D435C8C7D2
	for <lists+nouveau@lfdr.de>; Thu, 27 Nov 2025 01:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D05D10E6EC;
	Thu, 27 Nov 2025 00:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A4SVclWe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013068.outbound.protection.outlook.com
 [40.93.196.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08D10E6EC
 for <nouveau@lists.freedesktop.org>; Thu, 27 Nov 2025 00:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smZcH/3t960fkpYQPlX4BxUppazgy9cSJUd4xmueBeS+Fju1PW9xcZb11PWTxZFq4lSfhJ2mGndIez2fbNkwUhuhh97KejbvyhV/nJIEFjRi0moLrhatLhNufbN1tvF8BJK0vPWYIFaRkOK/SqcmxQSpd+xvZ+MwnKlV9Mmv3nLXioSULqZsSEeutxQpNZeUorFpkrg2VBQUWMD182hfDZ5NfqnUC02Ifc7nOmJr6ED2iK89SFBGLSMJVp0y23dUgcmRJRZA0IEdxBvcLhPegfSQ9CvhKrNxHOnMZW8RR5qt5XTQ+bEMKXNrsYwEiyX2IZ9ehIcYET9Z9O4N+N6MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MV7SegjrVMZYe106xtYZtgTr5hMapFZh4uUWrABbnE=;
 b=vKYU+Uo1ex+K4sPWAVQAfZZQpAqM5mioJh3K3lnlPHJ4hsYfi8zNlo2ZBkmpuCIC0MiYSpsCXIlFs7Mj/3KXESQfCdvVemfdQR2m8GnrVYu/76b7wIt413PFmVU56aDTjdXCJ9qpFftaOt9hxLPd6hB7BtHZrAOGjf1Pi+G0EJ/PuefSh/uxLtJA3L3/07phIr/8IWwYWNfR1+WmjwcJK/AkBir0PNbUWu36l0s7qQddkWqgIVZK1xXK85R/snhzwGV/xaTLww5+6YoTk/+XKW7m0rhcOJwn+r+r1meY6DD8aUA0LXB8Appe5JhsOXM+iG1bllWL4vvX/4pcO3tmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MV7SegjrVMZYe106xtYZtgTr5hMapFZh4uUWrABbnE=;
 b=A4SVclWeypwJnWMER1E0m50j3WgUZilGlHtqlNrJuM9MY225x7NZi4Hl7TDa8JEoWLNN/QpM7PJI9ygLtfKb948mkM7cMdI/6sA2re1yfNEIjIKk55kpbJGs6W1Vp5zvd4kVOWMEm2/3RcvKuOlQjW9y32pt47oLUEz0XLhhDovhQ0ZNLcel0ts0J179Xig+huoHqk7GPgCQ644VLVhTGSE5ROU2+MBfq7POipZRqktfLMtczZ+V5sWteajtYQmweSudrH/QsjF2Hb8CJOVNF5LEHOQ0wiuf8RIoQJ9xvYu5x+Mfi0fsgzNtIbi6Yqx61G9SxIFb7qudC0R3h/Q/Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY3PR12MB9578.namprd12.prod.outlook.com (2603:10b6:930:109::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 00:53:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 00:53:42 +0000
Message-ID: <49997040-a745-44aa-94d5-517845271094@nvidia.com>
Date: Wed, 26 Nov 2025 16:53:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] gpu: nova-core: add FbRange.len() and use it in
 boot.rs
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251126013936.650678-1-jhubbard@nvidia.com>
 <20251126013936.650678-3-jhubbard@nvidia.com>
 <44b56a133d2bcbb7606d31839bac1ecfab509ae1.camel@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <44b56a133d2bcbb7606d31839bac1ecfab509ae1.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY3PR12MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: e14442d5-f16c-4cac-34da-08de2d4f68d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDIyNXhLaWVQS2xucEhhOVRvTzBGWTFoc2VHblIwVWJvM2dyYUpBZ0xiZHFH?=
 =?utf-8?B?Q2Qwd1h1dmlUdkxTb1R1czVNOC9pZ3dsdE9sYkFOcUF0UXJKdmlaMUcvanp6?=
 =?utf-8?B?azROVjZCcEFKZlpCRzFoN1BRYmEwekhjQlVYL3Z5Z1luYjZ0djNWNlVMSU5r?=
 =?utf-8?B?S3pMTi9HMjBnWGVDZE0xWmM4R2JDRS9IK3c1bVFGb1I0NGZCQkU0dENhVWdh?=
 =?utf-8?B?WjdiTHpFUWR2NFlPMmZ2UUFRbW51UGRZVFpWRU43bHNiUTBaRkp6djc4TEpz?=
 =?utf-8?B?aDc5dm9zNCs4STZYblM2V0hSZ2l6NTROMmRlREg4RnF4WnJtY3JTNVRSVVFo?=
 =?utf-8?B?ajhqbkFWQlo4WkxoQUViYk42MEk5UktqU2FnVjFqYW9MRFJJd3dXQ0UrWlhh?=
 =?utf-8?B?YUxBQ3Q0OEZpMDlDUlRPRzVKajhEUGl2Zjg0ZWxiTWthMkJSVTcwRHRzWUdL?=
 =?utf-8?B?QTlOOFFTdzB1T1dhWDRXV01ZS09iZGo1ZCt3QzZ1YUYycXZwUk9xVXJMRHdD?=
 =?utf-8?B?MWUva0NIN2pEY3Q3YlRUbFk0aVFiQXRBVStwYzN6RWlZLzF1Q3R1UThYQzg5?=
 =?utf-8?B?V2FpNmwyaE5TbEM5eGxlVGlsQzRidzluaE8xbDFMOWFSMjJ5NW82TFIzODhO?=
 =?utf-8?B?RVVhdVNnRkdkOHFmdVBVc012QU14dm5TN1BlUnlBb3Q1cVQ3WDM5OXh1OHpJ?=
 =?utf-8?B?cXFYNmpCMUtUTFc1dm40bkhjNDdFRXNsVFl3MEh0ZkNWbGV5WThWUEJIaEhG?=
 =?utf-8?B?T1B5RTYxUTVyZDZoNENWNXN6bWZvRHpIdFhrbjA3QWNncVYydDZWTWw0c1lw?=
 =?utf-8?B?bXFsRkJrbGFDY3pkems5MEpjY0NpRlhIeDV1VUhqKyttWnNWejVONk9DL1lp?=
 =?utf-8?B?cERtdm5Uc3ZBdWI5VzNwUTFDcklxSTZPV1VlMm1NaFpLSWN2aXNFbEJkN25o?=
 =?utf-8?B?dDhhUVJ5MkVPOUlENHZiZi9VY0Y1L2t5c0VwdCtlREYydjVFSjJQWXlVUFRE?=
 =?utf-8?B?LzBGTHJqZlg3dFI3T2RDdk1XenNVNThKa3RuTU5hUzlVa3lRTi9LeEdta0hu?=
 =?utf-8?B?S1E3K3YvdithT3dJakJ3Qk1zNFpnY0VqZlc0aUVueHpFTm41czNFUzN6OGp4?=
 =?utf-8?B?VitBL1FQaG5JUmpxRERvNWZYVTN2SDJHTE5TaGdQZFFibjNIcjU3cVdsN2tz?=
 =?utf-8?B?c3Avb3dMdFRzOHpIUDNxb2lrUUZWMGcvVWE5SXNRNHVVZXRmMGJNVWlzOGJ0?=
 =?utf-8?B?T0lYK2VzcEdiRHJneUVJYjNSUSs5U2gyY3BsM0FaTlpLUkI5bzFxOVlXNWYr?=
 =?utf-8?B?TUVTL0F6N2pUNHpvOGkyRmpLYUt4Z0xpNFhvQ1l6ekU5WSsxZDVaQUlyOUdD?=
 =?utf-8?B?UjZTelBseHdtRE14UTZ5YjFvckVpQ0NkSlV1RmJmdFhxenMyTjZMTElCUk1K?=
 =?utf-8?B?aHE0eEhvRTc5UkJHZHhFUGNxZWJhYXdvTDFOMTBBT3RHcFdRbzBZVmlUWkM5?=
 =?utf-8?B?T0RDZTZ2Yi95aGVKRzhIT0RCWG5XV1JOQzRxQ0JIaDdqbk5KRzBGTlIvM0x1?=
 =?utf-8?B?cmtkbkMzZndtVDFhUXlyL1NqUkdIaDVQbkpvNnpsTnlhcFUzWGNSYm9YYmM1?=
 =?utf-8?B?QTVSUlppVjF2MXlqTmIrOUNaMXZGbEhHZG1wVm5KOTEwN3hpZVB4QlZoSm01?=
 =?utf-8?B?WGpWSUcxOUUxWC9oUWdZaW0rdHIzMjFOaEdrcTFuWXgwRzRUdERWKzc1Tm11?=
 =?utf-8?B?ajR5ZU5GSzdaME00ejZsdkFmdWdHdG9xUi9Mb0pGUHpDQzFXZTR3eXVadGlh?=
 =?utf-8?B?aG5jdXEzUVh2STFGL0RsOHBBTXNQK1VoaDBCTGdqT0xiNDltQjhVSTFsU0hM?=
 =?utf-8?B?MWpLQi94M1ZjbURCckk5NE5oOTk3dVBUbHU0Y3NhNDdFUWZyaTB0WVZnSGgx?=
 =?utf-8?Q?2B80MRnVaktq5Fer2DInd7kZayuehq5s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFONEx1YlFQYVZQaXFRc29PNGN1K2JFaEZSMk9oK2lKeTFNTXc2a1RJU2VS?=
 =?utf-8?B?N3lxNkdsaFh3cytoSFczMzNWV3BKcE9DUUJNUENhQ0NHK1d2a2NEOHhHakJ2?=
 =?utf-8?B?OXNDT1FVQms4YTh1a2prbEJ5enRMRW1lZDZZTmtldmxsNHQwZEgzSkExc3Ux?=
 =?utf-8?B?d0dabFVYSlVwV3V0UXlibFZQY3pTRTA0OGVBSzRmSDFHZG94UnRBcWFJbGRX?=
 =?utf-8?B?U3ZXV0FlWHd6eUhmMlErQzlvN3NPczBoaGM0cmdHVTRXRDRmb3BZSGl6QUhM?=
 =?utf-8?B?RHZDaGNwTUpkU21yNm9ORk1BRVFJYWdvSFhLajBMaUV6RlNpY3c5YWpGMU5o?=
 =?utf-8?B?eXhQektFU0cxZDlJTGMxVllNNXl0VElEVWw4ZjZ1dVlhWFNmVDZIc0tPVHdq?=
 =?utf-8?B?eUxnUC9tbG5aNDZjRVB0MXBhcDJMZjJVbTE2ZGRtZWZOV2JkNktJSklEQ3B4?=
 =?utf-8?B?MjhKc1p2UEdnOEZJdGd3c0hOOHhWclg2KytTWGpmZDE1eWd5UTJCV2FLdVpU?=
 =?utf-8?B?djBCM1hSUWp5TmYwS09abk5qQ2U4aXNCZWtydDZNbURDRVgzbFNjNWJqc3d6?=
 =?utf-8?B?eExWOVJRcWVtbzZudk43c09lSXlsVmlwVUlPM1dtRjdZUUFoQlo1ME1aNTJl?=
 =?utf-8?B?VTlWWjF1UUVJV3ZnWUtTV1hBTTJnN1hBSDRGSE9Cb001Znh5WG00NlBvb3dt?=
 =?utf-8?B?YU9oSndvY3ZNWSszWHpkRi8zMVVHSENWc05xc0s5OXd4WXNXT2RzZXB6eHJB?=
 =?utf-8?B?U2FsN3FEUVdPbDNQRWoyNDAwRGQ1UEhndUlETExpSDMzWTZkclVTcURrWFFw?=
 =?utf-8?B?MFhpSUt3WHJSZnN6Wld3QVdyMWdhNUVidGVTSW5LOGUvMmVTQTRKRldPSjBu?=
 =?utf-8?B?WHVtRzBrQW1uMi85WlVpZ2RFTXNwcEM4Wk5laWJUYW9vZjYwYWNIZUJ0VTVv?=
 =?utf-8?B?U3o5clNiUUtkanpra3VMQUluSTZVbUhUbzBOQmM2bDJlaFNiZHBGL0hEb3RU?=
 =?utf-8?B?c2tJWDZuRWs3MEtRNnRvalRnVFExTm5XMHY5TEc1ZFdQeHVDU0E1bElvWmto?=
 =?utf-8?B?bUpNOGtMWGNEdm5ubFY1WjlPR3crY0xiRmUzQ1M1MnRCa0V2czljQTc4bE5y?=
 =?utf-8?B?RXV5TmpLZDdFNExqZk9UQ0d0N2FIbmY3TzFISEZFblZXK3RnTHo0VG9PMWoy?=
 =?utf-8?B?a25wU1BKcTVyTkk2NjRwbjgxaVpnbU1sZFBkTTA2YU9OcTdvWDlYOWRZblFt?=
 =?utf-8?B?cW5SMjJFYXU0UG1pR084VUpNNmJjMFIvUUJMSFFZdjl6dGhndnNQbEExUzBI?=
 =?utf-8?B?Um0wM281RGZaQllPcm5hb3k5UE9WNGpZNnJIYjhuckNiN2FtVnkzRndZakRh?=
 =?utf-8?B?YTVRVkN0K1FYNTZmbXRtb2RGa2VRbXl1TWFqaEVta1VaOU42OXFLUG0ydHlX?=
 =?utf-8?B?N0Rnb0JCMENqcnYrT25pVGdrMExxWVJHRkNYdTNtRFJGN1NabEhOV2pWTk8z?=
 =?utf-8?B?YzVWV21YcUJ0UWVJNlVOSkFQaE8yWmNKQk5peG1IZVdNczA1U0FKUVFOWDd2?=
 =?utf-8?B?WWY2WnNKMTRJcmxTZlRMV2MrYnBRR2NyV09OS0VxNmJydFF3Q3pxQm1lNktU?=
 =?utf-8?B?OFB0bDZFWDdiRVEyazBFdnIva1ZBRXR3akxSanRrUE8zOGtlclJ0ZmN2WTVh?=
 =?utf-8?B?VHJTeFEwYXZLRTlxbGIyTVRTSmorR0JmcXBXa1lnUVhKL3BUcU9GcGVQS2lB?=
 =?utf-8?B?MU5BakxQemE4dmpGaFRmd0FUSS9wUmNEdzQyUm4yKzF0SndQZG1SVU9TYkVa?=
 =?utf-8?B?OGRLSk1oMnpaVFBBckNjQktzcjFmdGdqNjFBSVFqQWZjSTJpOUlUeU84YmFu?=
 =?utf-8?B?dlMrbmF5YjdTcDFHMjFMZjRMT3hWYUttWXFJek9rb0RFSkwvQlpuYU4zeEc2?=
 =?utf-8?B?dUptTVdYMDFnbWZiYWpSaURyTXFlaVkrTVNzYlVFQXVKWm56WTJ0WVp6U3VH?=
 =?utf-8?B?amlpR0ZJaW9JaFlSUUN5NWd5SzE1S3VkTmxMK1ZoMFRGVUczb2tKVUZ1NzNC?=
 =?utf-8?B?amg5Z1VGK2RyZmFPRVRkTUFJUkY2QWdTQlpsbjU2NGN1azhjdXE5Zno1bVpI?=
 =?utf-8?Q?hwtcQfT9eJJFooZuWUm6fMALE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14442d5-f16c-4cac-34da-08de2d4f68d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 00:53:41.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YCsOFu7UcCaZerqb5DFrSf2QhC7qR5024DyigYgzsKPK1Jsr+wT69FXaGUhhlvYsagiSmuNSc6bLFaHgfs9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9578
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

On 11/26/25 3:43 PM, Lyude Paul wrote:
> I'm not sure this is necessary - for one, we could just use the .len() method
> on the Range. As well - if we just implement Deref for FbRange (which I think
> would be fine here) we could just use .len() through that.

Hi Lyude!

Good idea about the deref coercion. It has a minor type mismatch as-is,
though: Range<u64>::len() returns usize, but FbRange::len() returns u64,
which matches the callers that we have so far.

Thoughts?


thanks,
-- 
John Hubbard

> 
> On Tue, 2025-11-25 at 17:39 -0800, John Hubbard wrote:
>> A tiny simplification: now that FbLayout uses its own specific FbRange
>> type, add an FbRange.len() method, and use that to (very slightly)
>> simplify the calculation of Frts::frts_size initialization.
>>
>> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/fb.rs       | 6 ++++++
>>  drivers/gpu/nova-core/gsp/boot.rs | 2 +-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index 333e952400e6..9fcd915e12e1 100644
>> --- a/drivers/gpu/nova-core/fb.rs
>> +++ b/drivers/gpu/nova-core/fb.rs
>> @@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>>  
>>  pub(crate) struct FbRange(Range<u64>);
>>  
>> +impl FbRange {
>> +    pub(crate) fn len(&self) -> u64 {
>> +        self.0.end - self.0.start
>> +    }
>> +}
>> +
>>  impl From<Range<u64>> for FbRange {
>>      fn from(range: Range<u64>) -> Self {
>>          Self(range)
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
>> index 54937606b5b0..846064221931 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -70,7 +70,7 @@ fn run_fwsec_frts(
>>              bios,
>>              FwsecCommand::Frts {
>>                  frts_addr: fb_layout.frts.start,
>> -                frts_size: fb_layout.frts.end - fb_layout.frts.start,
>> +                frts_size: fb_layout.frts.len(),
>>              },
>>          )?;
>>  
> 


