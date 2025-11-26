Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EFBC87A35
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888B510E4D9;
	Wed, 26 Nov 2025 01:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iKxOqoQR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FF510E4D9;
 Wed, 26 Nov 2025 01:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lunMPpcKqFjawZxfHfsBJ0bCzQ/F+Ihg9sC4yLV4BRP+j8dKqC3zuAEC16Fl+n1a/mN44JrCjYKweN+SwCzMSDTIKCX+gtFO163WRyGc/JEtvbMLp97ENth8SNnT5WShXLjE/Qqk8vdOTGUHrIYwnXXsfdQ/ITFXml3EBc9kZYKq00wPmCRT6agWcgtvV+qLjCjP5jULisgA8HYsmng+HXXqdDp/j9P1qO+hfh/UAA6pYtiXMU4ROhYKVXEaoUo443x+AZi/4INFSJSRtRerIrvwHndhT1R+v8qukOh5rToPIJ+eMX1f0afZvVmz609JvQB4HtHW7gxo8SF2TkGgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB7GBYhYbUVM2ooZNNxOkxG6jQpZ6EKyyY4X9lTTXkk=;
 b=szl0sj7PxpXGYj9X1PLH50XNs6DE1vE0J0DySjsw820gjo2/4XK3dPW1XpRZROpilP1eG3SjVNeobmxi8TrAEm95r5/gqECiFAB/JEjmYM5LSkJazClER4N7YDY9HI7b5RPE1m/BIjT0674TB4E1kDTS4Lw7CIK711Pvw1b4f68rNzaRBLCtS4EjNsktMIgXVE1IwEUC0Y013fKbUpWYKjvpWQEGsG+Z0dY+KNZLouL8tPvdcONUOLhFeBFKcqeqzxr+3mkoXN3RQwBIDvJzMKcPZ6ugpwzY7w1StXz9TklWOW0kRxP66KLQHVYfp3OwCR6nzwmVB3V12xrSVLUxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB7GBYhYbUVM2ooZNNxOkxG6jQpZ6EKyyY4X9lTTXkk=;
 b=iKxOqoQRsKOyrlMsyEZJot2x+osUTzlPtDkxoO5+w7ZDAGZ5XIXSPKYdgb3s7p+0vMCCSHYm0jPcW+qR39IcYbkJXihsTFUgsxtdz72NpDKRnfrtMAxT942k4K9YuKzK47xdXRoQGAJI/u+8dhdxBfmJqADxbFcXzYLesZGWLq98hro+j34VevfT20oADs18p5WftXTWNKZuwtnesJVzubHdaTTkHxNTzzWjVhFThiT+5v378AA9joe5qNIs6uOV4M4hE9Ns/uRnvNCmg8KQzaX2cAoKU/sCRlZzUgGwDNZ93WZyrKJ38UAk8JrUKynZVcEIfTkIt1qq+V67b4rsFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 01:05:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:05:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 10:05:43 +0900
Message-Id: <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
 <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
 <054d9c84-4231-4662-8847-4028228cd290@nvidia.com>
In-Reply-To: <054d9c84-4231-4662-8847-4028228cd290@nvidia.com>
X-ClientProxiedBy: TYXPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:403:a::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: bba70406-4df3-4781-27d5-08de2c87eea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVYVGNTQ28vYklDU1I4bHRDN05RR1dzYlFsaHhTVUxtRHczNkxlVUFMR2dr?=
 =?utf-8?B?Y3JjOFRyTDBucUxHaWpOb1V1SHhUZ2J0SFRscG5aTTl4bnZzZi9VYjJMb3Qx?=
 =?utf-8?B?R3VDM2FPbjdMaXRqZzNUVUhYaHpDZjB0V1k1VkVYN2hlMXBuczRmK2x1eTNI?=
 =?utf-8?B?R3FnVUtnVEhacTNnL0VSalNGYnoyQnVuSER1RUtabW11WXU4dGlWU3llQmh0?=
 =?utf-8?B?cFp0VU12WDFhNVpvbzMyNGhaTDkxcHUyTkhDZDRTeWY2ZWczVmUvYi9jSVFD?=
 =?utf-8?B?QUE1dkJmOXlJcEFkTlA0SEJKdy9Pa0kveFZ1T1Iwd29tV29UMHRERm5KcEVu?=
 =?utf-8?B?ZkxWdVR3RkxIUWRLTmw1UU9HaS81R2lvY2liTzlFbmFXbEpDcTBuODhEVHZ0?=
 =?utf-8?B?RGNUN2VoOEtEd3pwWUF4Wm5qK28ySGNYdXV6V1VvaHUwSnEyb25rZlFOK252?=
 =?utf-8?B?NS9wZmR1Y29KdlJBbjdjd3NpdUwxZWdOa0liNEFBbWhPNVp3eXNqY1pKMzBB?=
 =?utf-8?B?UWJUbzh1bzRERldUR0VnZ0xKTHA4VlpnNnViMnVYUW1sSit2Zlo0ZmZLdEFO?=
 =?utf-8?B?VUx3cVhiRmpEVnZaNVhiMjZTLzFqMmhqUVQ0bVlNdjR0eXczZXpRNU45L3I1?=
 =?utf-8?B?cXpqNXMxYXk3SnlBdUQ2b1BPNjR6d1oyd1ZLOFFiU2tVNUhJWWs4UmZGcDlH?=
 =?utf-8?B?dVVhNkJHVEI3d241UmVDTTY3ZCtRaFd5T2pEc1dQdHczd043Tlg5aUhoN1lu?=
 =?utf-8?B?U0pGLzUzejF1WHpUYzFiYVFGR1NpeDJZa3ZOZ0ZZOXRGc0VRVVozTWNWWHc2?=
 =?utf-8?B?ZkJlZXQvcndaNjU3K0YvK3E1Z0VqYUxRdVFiM0cyUUlDSGQxT3hMRTdwRnlz?=
 =?utf-8?B?MDZiWldmNndjUHZkTGZrdW9OTUdzSDc3SHVjdDRjNXZLaWlDeWczMktnY3Ey?=
 =?utf-8?B?aGpjbVpqNE9oZ2JiQWg4eHFsY0c0dGVFenhteW5HNGRUQjA4aGFNQ09lNnB2?=
 =?utf-8?B?TjgzcjlvcGtmT0luenBPdVN2TklQSjVnTDIxWkpiS2s3L1kzZmVzUzVSbDFU?=
 =?utf-8?B?LzdkbHB2R2t2RVVhSXp2SFZ6WnN0SHJWb2hUNEJMTTE0eG9MVlBCMEQ4VFpk?=
 =?utf-8?B?QnpZSkJNbXBWdFQ4U2pYd1hUL2FSYVJXZzROZlpWc1lNckJxM1VLTTRQR2xw?=
 =?utf-8?B?UGc3MDZSNVB1anBaWVY5by9qR1lycW9wUW9sT0tPNjRIRzhwOGtxcE9kMjNT?=
 =?utf-8?B?ZEV2MXBtUi9JcnFJcHMwOXVDWWNGQkd6bFpERk5Tc25YZ0JiZmdoTndDQ0Rj?=
 =?utf-8?B?RkgzUGowU1l4Qm5xZ1pPSXVzV28wZThTNU5XaG5xZlY1c21jcWp2OW9xSkZX?=
 =?utf-8?B?bndnTWFzQVY5NFoxMTUrb25NWkZDQk1uZi9EUFBaL0FTTm5FQ2l4VUpmWEhR?=
 =?utf-8?B?ODFNQ1ZVK1FLelhLV1l4V3ZqeUR2TnNiVFJSTTliVndYb01VRlN1SXc4eDJC?=
 =?utf-8?B?L091d3RteDFaWDJrV3ltUXNRbEpka0pZR0JMQWtuZTVDU3ZUNUxSYlI0UHNK?=
 =?utf-8?B?R0xmdE9SL25kdzFiVS9hczFscDJIdERlU0pHT2JpcUF6SlRiRkFZbnBXU2Nx?=
 =?utf-8?B?cVJCVjZidHk4V0J1dE5zSlppWmdBWHpTTXFPc1lONnhVd1NTbC9nV2V0TjNG?=
 =?utf-8?B?MDdzVXpMWXJmVTlIb3FuKzVRUnlHVWJQVHdEem0xMm5xZEc4aGN6ZkdmSlgx?=
 =?utf-8?B?ZHo0RmFRSm5WZ01OcFJOQ21IZGgxTHZORjJJSUdjaEtGbnl2MXVCUEx4eVF0?=
 =?utf-8?B?VFpJYnc4T3kyWnAxQTNHS1ZxczFXUEpSSEdBb0JOVTR3SUdiN1JZWUcxSDYr?=
 =?utf-8?B?anY2dEdHOFNaZ0pPOUltS25BRzljVlIyYWFPeDdnZ2xjRlR1V25qTUNES3RG?=
 =?utf-8?Q?RmJ3DfO4fBw/ZV0utBggeWRkDGIwo7rv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlMzS21YZ0JPV0ZXcmwzYmxMYm5zclVxMisvTFhJQVQwb3pzTHV1ODZaUWNR?=
 =?utf-8?B?R25CZFZuWmhtMzNJczRLTmp5bTJtclgyN0xEKzA0OUJuZENBVVhRelZWQ2Nq?=
 =?utf-8?B?QUhjVWJTSTFDbEx6VGx1RlpCRENsblBSaDVOQzB3SmVYSUkxWnhCejdYcDdU?=
 =?utf-8?B?aHhnVHdET3UydHFhQnRsWFlNbVZwcG0zV2g4Q29Ja2R1cjc4NHhGbTFOWHhs?=
 =?utf-8?B?NFNIS0d4VjVKbklTZmkyT25ZSmdlUm9KbjRkSGk1RW5odWZ5WS9HeVY1aXVT?=
 =?utf-8?B?K2hYemIwc2JUdjRKVWNmNDlYK241Y2xzSWNpeitCNHljRkZUMHBvNWlsMGZM?=
 =?utf-8?B?QnFWdVJrZWN5TnpmemdrU0VHcW5pclJvYWVlTmR4RzFpbURxenVTWHpFek9X?=
 =?utf-8?B?VDZNNXBYdFBYa0FQMGpIdXpnYVhvS1A3d3JOQms5bm9aa1JzazN2dDdRL1lq?=
 =?utf-8?B?WFp6NEpiUXFjanRwYXowMk1uVWVxUjNiR2o1SjJZM0ZKVlVOeWlqeTdacUcw?=
 =?utf-8?B?MVlSVG0zTkZhWUhKdXp2ZTZVM3Qxc2FPRjFmaEZBNGVkZ29FSXdTTDR5MU9V?=
 =?utf-8?B?MEJkODRxUy9pcTI0T1c2bGxXT2p0MjI0UXJWUlpiQ2FIQmNoSFNwZmU4T0kw?=
 =?utf-8?B?Q01xZzlVektZTTIyLzdnTUlWK0g2SFVJT3RVdFBtNVk2Tjg0UG45K29mV0Fx?=
 =?utf-8?B?d3FUMzE1cWRvcUtYOFRUdEpUNmdHUFBTeDloYzZPSlJMeVRsTHdMRk1qZVRD?=
 =?utf-8?B?a1JpLzdvUU9tSnhzVDBWRUlKbUozWnExS0Y4aS84UTlFQXhFVC9sN016SEYy?=
 =?utf-8?B?cjFscTBLdkkrdjgxUUt0cFFSVUNuU1hsWUsyL2U4RUgxYWQ5V09jSVpwVW5y?=
 =?utf-8?B?cXdaZTVqeHdqSndia0Y4bXNjV05DR2k5TG9sQy9pellUNVFFT2hRYVgyT2h3?=
 =?utf-8?B?Tzg5aW9iZUNTZitoY0xNV3AzZzI2czZ5WVNZaDd2WGs1WlFlZWFZeTMzY0Zo?=
 =?utf-8?B?dXBCb3JISFNCeW1qUWJNN1M5aHRJUTM3WXZEUXZMMlVjVkFTeVFzL3BFUk5u?=
 =?utf-8?B?VFB1Q21PdkNnVE1sR01MY01tVW9VUkhPYm0yajk3QmhTc2NrdFdmMWZhTFJ4?=
 =?utf-8?B?M2ROM3B2NFBhQ1JxN2tmb3pROEd2Mjg4dWpobEZhV21mNkcyVCtDZGY4ZXZu?=
 =?utf-8?B?cDVEazV4UEpvNW42aklDTEZiQnNYczNzNkE1R1RKSVluK3RMbmU5WXpNYjdY?=
 =?utf-8?B?QndYK2JCMzhuSkhrTklhVGZsbGF6bW02VjdCaVJ0MVJMc3JaenJ5ZmdxUVF1?=
 =?utf-8?B?RnJUNXJmWlJCczJjbEkzaDhUK3ZoQmFaZVJrbTdRRTU1c1hIZXVPRGg3SllB?=
 =?utf-8?B?czFyMkdjOWwwODA3dnYyc2I0M1pXb0pRQzJENHY4WVE4clA0WUFoN1gwMDJr?=
 =?utf-8?B?Vms5RUVoZDJiV2d3cXRFVHN3cjI2VUcyYlpKWW5xNW1wTW9nWkIvSWdJQmo2?=
 =?utf-8?B?S1ZCaG1WK1dqSjJ6QWJlS2VnZENxd1kyYnB5SWZFVmhDZlNjdDBHdlFTZEFr?=
 =?utf-8?B?V3dkNHpNdFZPdk1JSUR2clAzdStDNmRXRnJERFVsbjZleWJ2UXJQVXpBc3F3?=
 =?utf-8?B?eGRCWERneDN3UW14MDh1WkI5VzUzTGZTYkpFT3NXbmFBUFdaWE9sUXdyU1VL?=
 =?utf-8?B?VUZZYmRoKzNteW9ORDhDTUY3UlpIaXlhY0VyU25pdCtVc1N3ejJ5d2U5dnBm?=
 =?utf-8?B?Y3FMTEdrbUYwSE1scEZmMlBWemhiekY3clcra2hzVzd6bmRFeno5ZTdONzlP?=
 =?utf-8?B?cWxVQ3hLNnZWZ2JuTWR2clppY0tKZTRaVWdRYnRuMUdCNFBDaVl6Sm1kV3Rn?=
 =?utf-8?B?MGFUWVFFenBiZGtaOTczT2lDZTBaSUMxTjFPSjN1dC9EYjdWbUtIOXNnMEpy?=
 =?utf-8?B?NDBRdWFrY3AzdTZMWWNuYjJJa0phYXp1OGtZQktoekFudE9vN2xBcEdpTGtC?=
 =?utf-8?B?KzY0bEdJbFFwa2R2Vi9CSUZDNHBhcC9pVHNQWXpBRGZPZ3ZEbFJUcmhLMllK?=
 =?utf-8?B?L1IrdjQ0Z2MyOEMvUHRWZVU3Vmxsem16YTUwZ0YwMWJoVWRHWEhjcFNsQnI2?=
 =?utf-8?B?NjB1OWdKcllhSXJUWXAwY2M4MFBOOURjVEtnbFc5ajdmcmJoKzd1SmtOQ09O?=
 =?utf-8?Q?B0dHL8F5B9FqwifwTozk20FmXreCp3UoOZfxM7OgOYjw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba70406-4df3-4781-27d5-08de2c87eea1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:05:47.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjbIZMhfD5NOd+291wqPNQrWNonUHx9EzuvPy4mOMwsZ30zIb3a30afoVdIYaVUglelAmzIWjz5jL/tzdKD/aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
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

On Wed Nov 26, 2025 at 9:31 AM JST, John Hubbard wrote:
> On 11/25/25 3:59 PM, Timur Tabi wrote:
>> On Mon, 2025-11-17 at 18:10 -0500, Joel Fernandes wrote:
>>> // First define trait
>>> pub(crate) trait FalconUCodeDescriptor {
>>> =C2=A0=C2=A0=C2=A0 fn imem_load_size(&self) -> u32;
>>> =C2=A0=C2=A0=C2=A0 fn dmem_load_size(&self) -> u32;
>>> =C2=A0=C2=A0=C2=A0 fn engine_id_mask(&self) -> u16; // V3-only field, V=
2 returns 0
>>> =C2=A0=C2=A0=C2=A0 ...
>>> }
>>=20
>> Isn't it more idiomatic for engine_id_mask() (and any other field that e=
xists only on one version)
>> to return an Option<u16>?
>
> I don't know about idiomatic-ness here, but we have been trying hard
> to avoid Option in fields. It really makes a mess of things.
>
> Other approaches require less special casing, we've found.

IIUC Timur's proposal would not require an Option as a field, just that
the method returns one. I tend to agree that this is more idiomatic.
