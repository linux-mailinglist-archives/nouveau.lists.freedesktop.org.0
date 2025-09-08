Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B1B48F63
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 15:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60FE10E210;
	Mon,  8 Sep 2025 13:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k0+2gU+2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAB710E514
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 13:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzlTgh8MUIpH4irA42NO6dQeAbli0Nj6eVhDA8IpdGV5USLZ+v9jrjT+JF+4udP/h1BBYxNiMWgyPzTD4iRohKLa+/uhD1F1+lRn1i9jxl+pdoDLTnSg2GuyUbQ0t9CN8O66r5qRG8CoSQ9zCxS+fiNMhJYCEOvMFcTbK6s1PbVosE0JfvOdEp7SsuF2VO6lQUpgoR8w2pDSQQum7QNEXyNEJN6ru9AYPt9Dy3EzwRuxYgSmeo6EglXcp2fLOn0rDtiyHcqVhDIO1osaL66gMWWKiCU5KQT+kUwQX38pWH/iQJ+d9Mgi9BUSgpqk0nWz/59492FK84Pjb2Qus6MblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqrtTfPiSd2KEmqlJZPXQVxjnJwBT42KAf8EB/qUex0=;
 b=B+hY5+ReOKVpsguODrtJFpe9MhqrYRvnvIMeViTa7UTDLLrkn50TG4IENqGItvIAg02u1ifQC/ffD7RCq7NNAiN5ZJbv02Wo2BdTsNbNlFVqKYA0u6yNbrIphYQUPdhZnnKdYe5GYCsVle3IwSu4eVlLDnP2MkfSuLcF5uCTZ0FXJAD9JL1x8HomGpfyTAXkLTVVQILBVQXl7d5gmyTCLk2SGKrHCKBTuCNCMb6DTj+lHOqnKd4cZ7cdxoRSfTTDbX+LkEXbGTcqfxiZL+qSbLKQM7RuPwLYjDlA95oUUZicirwMMwJv9CXd7M0seog6kJGSDI4WRg9BPFOdCic+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqrtTfPiSd2KEmqlJZPXQVxjnJwBT42KAf8EB/qUex0=;
 b=k0+2gU+2rUBAvYu7xEAb8/fPDWS9dBShOHeC1SLvtM+4b7RRWT/nyIyX98qf+cm7hHZqJMHZ7TuqsiwPKf7PtCrkBZ2mLQETsGn5f4aQtH9HtaKPn7xD7J+UpHbO4QWUosfYLa8WZxdov7auh0UHi5Vsm1WpVkRfJzD8z5vK5vtlwgHn/+iycigNC4MIPSOFv3i83FRL7NTlvRj7+PEAr50wDFfGbl1V+LVpnxTs27+t0TjCTIWCFoCOaYSdF7Px4pZTwSTr373F4CjdIeofX/ExqaqV8Nfh2y0jWFfdYgtjwV8zDfV0J/J9wcbkui3TecZkK9TJHz8CY9cqteslCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF3487F9737.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::990) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:26:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:26:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Sep 2025 22:25:55 +0900
Subject: [PATCH v5 2/2] gpu: nova-core: use Alignment for alignment-related
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-num-v5-2-c0f2f681ea96@nvidia.com>
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF3487F9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a88a1fb-1972-4476-bcff-08ddeedb46da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkVUdGgvZFdHZ1JOL2JRTVNNQUM5NlZMUEZqR1NudjBvano0YU5wTHgxNjZK?=
 =?utf-8?B?bWh5VVNYcGJDYmdGenE3TUNDa2hrcGJUYmQvYjJmZU1TNEc3U0d6K3NiSmhH?=
 =?utf-8?B?ZEpvOWUxdFpJYlNQMGRIc0pyR25qWng3eFRTU3k0aXl5Q1BSYlhkb2FwQS9N?=
 =?utf-8?B?dFZzM0VsWWY4dEg0ZTNlckYwS0hoNGdOVXJwK2EraWlvbGRsWDNKUzBLTE5C?=
 =?utf-8?B?YzhrRVE3S2lwOGo5R3RoWFVOUTRLbHM5SGxidVNGSHY3andVU0NaVDdqQ2k4?=
 =?utf-8?B?ZjI4dk02ZEdEOUlBSHFhMTF3NEZmdExUNnBQWTdxVjFmSEhiUVlMYnBkUElz?=
 =?utf-8?B?aVl3TU9HM015dlpxUE83bTFNWVdSem13Rko3aGN2WnltVUpqZVlaaUVUMDNW?=
 =?utf-8?B?MFMwSmlXU09wcmtnTUJQdFZWUGRBQkY1dTZmWnZqeW1nclJoTDhHdit0K2ZS?=
 =?utf-8?B?ZlVpQnFmWUtUSjdaeXFOaDdoZjNXZ2VtSzEycVVmYkZWMGpsa2FmdGo5UGtW?=
 =?utf-8?B?b29YdTNSeklzWUhkRFp3SmJpc2kvQjRQMGx3WEE2UUh3QkdCa2pCRzhtNk9Z?=
 =?utf-8?B?ZFV4NWk2N2p4eExudGRsa1BaRTNmRkxHYnZ4RjJOeU1vNVlqeXVWbHBldEJI?=
 =?utf-8?B?d2ZHaDF5NE9adXFoU0Jkd1dQUUFLOG41T25yeWlYYzlWQ0VoblAvSmRLVVcx?=
 =?utf-8?B?dEVPYjlpT3dueG45elRPUmJSdUx3ZHpqOFZBbVhxdzJZY2RCdlpFTXpvMCtx?=
 =?utf-8?B?WkIvSlJvVVE2MlNoVXQ1TVpRelROREtZZnRaVHVTWWJMZUFiZ1p4SVNoc04z?=
 =?utf-8?B?ME9jYTlrQU1jVitvcFJ6RUc5WEp2K1cyNXc1S2dnaGZVZGMwd2g1RnVTbjhY?=
 =?utf-8?B?anJvQ2MzNzBNbmYvQkJRVVlYNU5PL0d6NEtKUlp1SmNJUHA0QXNBSVd6V2Rx?=
 =?utf-8?B?ODBBSHRyc1FocDE4S1dXSDZqQ1VUT1VhRlUxcGRXK0gzcXp3cktDSHI3QW1X?=
 =?utf-8?B?S1V3TGg0U2dhcVZFV3A5bUQxV2d4bGVtSU1qdDBlTUxZMVhENGhmT2pGUkRo?=
 =?utf-8?B?Zmc1TGw2M3JTV3M1amhUdm4xSEcvY1hDWCtGTHJnMi9UOU1IRFU4d2FiS3pt?=
 =?utf-8?B?Q2Rma3RzZnh5WjNpRUQxdmJtWWkyTGhZQUhYMzhvWURNcHVrS2gyWWtCYXdC?=
 =?utf-8?B?RmNEbHJUZWRaanN2NnhBdFI4QVowa0VRWHdQL3FaMzFYTGN2Z1IydkkzY0lG?=
 =?utf-8?B?cTJ6bllGWndpdDR4RzcxS1I5ZnYrRmRkTlNCeE1TcEF4WVhMMVRqVHFuNlpK?=
 =?utf-8?B?Z3JmNTEvQzNnT3NXM1E2bERUeGgySnJWT2xqcXBQeFZ2TGFtOXg4K3lvclpZ?=
 =?utf-8?B?d2ZCVzRpUTUydmp2Ti9lek9rRjYxVXgwWEtHbDBqRXZ1MHFwMjk3MmpMVHY0?=
 =?utf-8?B?UFVwT3pINnlqU1B0SVZFejg5anZLTkU1V1NwblVSQ2Y1N1l3ZFJFSnMvWnVa?=
 =?utf-8?B?MEJ3VmRyZ1RWNXpSOUZURWQ5WlpCQWJvRXZ0MlM0VlpOQm9GbDNDUUVTTEQ0?=
 =?utf-8?B?UXBzZmVyaTdJbnlGbE1Vc1BaOHBXd05Jc3p2cXE2K0p2MmZNdWJFM0RZUUJI?=
 =?utf-8?B?SlFMUkpHNmJKM2lHRVNiSG9vV3lzMXZTZU5zVDVWNWc4NUFVWkpwb3RoU2JV?=
 =?utf-8?B?Rm5tZVRVdUFpNnhCajI0S0N0WUhXdm1qOWZNRmd5YUhMZVhtdlk1aUtMdGhx?=
 =?utf-8?B?d29HWCtjSGc2OXJlVnovUnp5VlRBb2NmUEluVXd4M0o0QzQwQk55WDg1cHds?=
 =?utf-8?B?L0NIUTRydHhIMHFiNXlUWDhXMWNVMVVuYVpXczVFY3hPQXpsWlYwQko2dVRD?=
 =?utf-8?B?UzJQczJpNmJOV3A2bE9FTlBCZ2h0Tzdld0tMY1VYNzF2dkF3M2c1dDNic090?=
 =?utf-8?B?UGRNTnlpdTRRejhUaWgxdVBCRUVxSVlyRVljUW5lQ2g3Z25nUkowNk92Q3dp?=
 =?utf-8?B?V2YrUFQyTXh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFWTFRlUkVweGpmbTc0VzVITG0zUExGOVNyT1NibnFLSjNMOGplZE1OeUlj?=
 =?utf-8?B?WkJTcGpKYkR1eW50cE5jRFg0VU5tL1VqTnFvRWdlNjlFV2UyZXdJYkVXaTZH?=
 =?utf-8?B?dXl2U1VHUkRTanB0VEtBQXZETFpMeDlpTmlyM0R0UnVvbnZ4VElQcFppNUFM?=
 =?utf-8?B?Q3JqTk1BNTdBNHR4MGw4ZzFVNE9abGNxaldGYzFvSlZpbk1kdHlzK0M2NkZS?=
 =?utf-8?B?RUhEUWtObDliTnFFbXphVGlwNytMbnhDMTZFU3FCcUhLME03NkxRRUZOaExQ?=
 =?utf-8?B?eS9QaUJhb05hM25kSk50NElJWFZzSHVhRVNoSXZKSnErNFNQUjNVUkxESTdV?=
 =?utf-8?B?c3djM1ZXR3Vsak9FV1dyUFhWTEUrR1kzbVVrVVIyellxMk1zbDg0MnZnelU4?=
 =?utf-8?B?VW4raGlGSk5PR0RteStWbGd3VEl5M2p2eGlnTmRXU0JJRldKNVVoNkd0di9M?=
 =?utf-8?B?a0phR1AxZEI0N01GK1dmSkxRK2lVcGFseElnUFUwNytESkowYkVhQnNiK2J3?=
 =?utf-8?B?WFVlU3I3aGdWaTVnNUNOMW5XQVFJUWVBZDlERWpTSnRnOTU1VEJ4Z1lvSTRv?=
 =?utf-8?B?T21KZ25uTGVxYWhIYjdHbWVTZE9RZkNZTjNpUkgvTG1XYk8vNm1jTVhNVmhB?=
 =?utf-8?B?Yk9nK0xiWnIwYUpsakR3bTNieWt5eFNCdVpHWmdJMi9iaHo2cnlzZGY2L3By?=
 =?utf-8?B?TjlBOEtnYUFQUDdtL0M0dHd3OTFxenJhRzJ6RDNoUkt1ZnorZFVvY2RyVm5l?=
 =?utf-8?B?SUd2Ky9vZ3pPZmF5SnVTV01xNGdtVmdDZXVGa0dWL2xIcXB3Z2JPS29BU0xm?=
 =?utf-8?B?ejdPaytUQWU1TzJOdXVmYkdvYkJCVEpPUWZjZWdtMHlmaWJ5L3ZXaGVRSzBz?=
 =?utf-8?B?cEtaMFVNbFRucERJOE9sdEJLQ1FoYTJqU0pMT3k4VnVqb3VvQXBoZ2UrRkx0?=
 =?utf-8?B?WEJUcFNKd3ROc0YzQTFUeUloOGIzdlp0dllWVitjdHVVeHlybXVWSGcvVkQ5?=
 =?utf-8?B?enRZcCtGTjQyaW9KdFphdTY3eU1HSzI5NlBUYkJ5MWd2cTZuVmVXZyszVjBR?=
 =?utf-8?B?ZU1KM2wyWGtycmg3cjVNUDYrdW1ubER2MnlkVzNQYXM1RFJwdUtaelByTG9l?=
 =?utf-8?B?RFVHdDRYeTBhSXF6RHcwK0FZN1huUkJlQXg5NC9uQ3NncS9OUFN5NEUxbFg3?=
 =?utf-8?B?OGJkTklqR3dtU2ZIcC9ERTFZOW1pbytMQndkYmcrQzk3SW8xRlFGRVI4NURC?=
 =?utf-8?B?YTYvamN5RTJBUlBONWtkbExTMkVJQjJzVVc3c09hZGFjME1xUTJpT0wxSzJJ?=
 =?utf-8?B?L0YxZFg3STVxbGQ0S2pMb1JUV3EzaWFJY3BqeHhlNEo2UHh1UjJ4TE5wTTZv?=
 =?utf-8?B?R2tqbGdxVzZOb1RSU0d3Vmo5SFRBUmNxSUNxNDRtRjhFQ21zTjhGR0xPTElD?=
 =?utf-8?B?SVVBZi84MUYydXJEZDZVNFQ2MTEwNHBicEEyTkxtUEt2K1RUdk8wYjMxTitu?=
 =?utf-8?B?TUkwUVFXeTBsTVBsNFpqT3ZFd3U3V0owUkk4b01qY1ZBT0dnUjlJeVRVampw?=
 =?utf-8?B?aHRDYXdBaVFqc3IxNms4TUpyeFhzcVVkSTQxUHRacnV4Y2szYjFFeUg3ajE1?=
 =?utf-8?B?VktrNWxIZDZHZFlUTHFlNWNTeW1yYzV3Nis0eDNXd2xkMXI4b21heE1FWmt5?=
 =?utf-8?B?THBCUzRpK0JCbVNQZHZJb3I1eXVqeFVxNDgxVWJhZmRaZWhDaVdjZ0I3SmpY?=
 =?utf-8?B?cFhqMC9MTDYvZ3hTTWEvWWozUDJITFhocmc2QlAxWmEzZ1NsVXVuOW5OREdO?=
 =?utf-8?B?UGI4ZUZyOHEvb0pheW01ODYwdUwvWmhlWnMxVk1LZ3F5SWMxRjF6SFhTQ213?=
 =?utf-8?B?RW42NWVTK0tPSXZuTFpnV2h1REZNQlh4NmdqQ2NYNmp3QTR0RWFQNWd1bmxh?=
 =?utf-8?B?Z3JBNXR2ZWR6WkJqU0dxcm16VlFGR1VLaWR4RnliVGwrMWpENVozSGdoL0ZD?=
 =?utf-8?B?NEg5Z2lSb2ladnM5dFl6VHdkcUQyQzdWbHpQWnlnWjA3OTJHL1pleTl6MTNT?=
 =?utf-8?B?THJIYU54RENDQmtLT1BmY1NIZEx4UXF2NkZXUTFNZTZ1Qm96NkJsa0dIeEp6?=
 =?utf-8?B?MFZ6Y2FlV2JHVEV4QWVMTWNvU2ZqRnRmdS9Yc05IdDhoa0E5NUYxYjdCeUww?=
 =?utf-8?Q?dVi6ybIDMkEuhH5G84pqMPGBqTq64oyaDy6gCueIrOB+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a88a1fb-1972-4476-bcff-08ddeedb46da
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:26:11.1726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M06HTnKvkt/xprjFiTT/ed/QpG9J4PmgSQm1p/fb3fWIeOUJCCBTw9GbvZJhytmFqdIcK0cIMh9CytV9iCv/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3487F9737
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

Make use of the newly-available `Alignment` type and remove the
corresponding TODO item.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst | 1 -
 drivers/gpu/nova-core/fb.rs          | 6 +++---
 drivers/gpu/nova-core/vbios.rs       | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 48b20656dcb16056db7784fa186f161126aae9aa..89431fec9041b1f35cc55799c91f48dc6bc918eb 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -145,7 +145,6 @@ Numerical operations [NUMM]
 Nova uses integer operations that are not part of the standard library (or not
 implemented in an optimized way for the kernel). These include:
 
-- Aligning up and down to a power of two,
 - The "Find Last Set Bit" (`fls` function of the C part of the kernel)
   operation.
 
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 68559902ae78bdef8d9bbe88a2f33eecde2ebcab..27d9edab8347c5ed3be104d62a9e32709238bb92 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -3,6 +3,7 @@
 use core::ops::Range;
 
 use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::*;
 use kernel::sync::aref::ARef;
 use kernel::{dev_warn, device};
@@ -130,10 +131,9 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
         };
 
         let frts = {
-            const FRTS_DOWN_ALIGN: u64 = SZ_128K as u64;
+            const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
             const FRTS_SIZE: u64 = SZ_1M as u64;
-            // TODO[NUMM]: replace with `align_down` once it lands.
-            let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;
+            let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
         };
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e6a06071420566560d69697e85dd0c6b384f33cb..71fbe71b84db9d93fd7ac8eca58e67f97e4bc46a 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -9,6 +9,7 @@
 use kernel::device;
 use kernel::error::Result;
 use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::types::ARef;
 
 /// The offset of the VBIOS ROM in the BAR0 space.
@@ -174,8 +175,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // Advance to next image (aligned to 512 bytes).
         self.current_offset += image_size;
-        // TODO[NUMM]: replace with `align_up` once it lands.
-        self.current_offset = self.current_offset.next_multiple_of(512);
+        self.current_offset = self.current_offset.align_up(Alignment::new::<512>())?;
 
         Some(Ok(full_image))
     }

-- 
2.51.0

