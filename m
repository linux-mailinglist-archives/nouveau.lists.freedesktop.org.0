Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10511C66CF9
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 02:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B99110E12A;
	Tue, 18 Nov 2025 01:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bfsxS79c";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012004.outbound.protection.outlook.com
 [40.93.195.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BDF10E12A
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 01:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecIUN2hrOuw79POro/jOz9Pe19DGdQacHqOfbiaWPIaJGfL/I3M1IwR3G1LBuiy8qmsHrlDmeZz8c1H5yZq8m7WSH5QX7YDMPIkZRfdEoWXY8ZWY/BNaeHJ4sshWidXUX2dbSTJ759zB4vzPwWc9bUvnDPxfLN1mMkGtqudkWOf6AIG14mQF6iRfrl/cDeg3j7Ipr1yxiisP8K9/MGh4mPCqOZyCS+klc5KbgMPfsEMEPIuU/x0LonWtllOkwqxt8uX1sQIkoIOV+5MBhz8LEHCvr1gVN/LlzZVUZUm99nE0Ynwmrq/pTT6wxWAOE29jog9kxswLgTGAf9mt23h6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Uv+MMwEKK43xk0Xfu91dCPp0zZYfXY3DG55ZxDy43g=;
 b=WBwf46EPxt7RmzDUY442aGFvlEl1yPjxBZh9LZzeA0aZu4H1AXBhgcKHMKA7Y8CRfID6TegrLhoWZcIr/rls9b7xl1epjW0CNbSaZRQaP0lOsph3V14T+T1qmUhNwJWnehCGVR8Dcm4Kauq0V+tDMb7KZPED1yza8YuvfF6mU7KK/mQFKn+2aqImPQtrkUMF52XXdbaX3tI1gxOWsUaWoMZj0bmK0qeODjOMZ+afT/XqDkFTF2B2dD53urmKoTdaurg0TM1MYDiOGSGSFYDRv7qaHr3qb9S2Eb94rNbAE9h/GVgUHQq+Fbfmk4pAdys6JS2nE3FqLwAGZA76xBdBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Uv+MMwEKK43xk0Xfu91dCPp0zZYfXY3DG55ZxDy43g=;
 b=bfsxS79cowU+8ivxqYaqNm4FsQGvMCyCjvhHem923jPCbVsT8qTyf8g2/yFzHcmWkC1U6KUlWWYhgGhY36uTr9PY2BFWzHcLFut4bNG99JLZ6gneLlgbSdbIhOqSDa56IkBMSTnlSEmxMg1RJCHIwXN7CgKjH1z7P1wHd1dKcIJZhwMuwpxGBN8vAjtNI87cqHrmdncdpDcCFKiQ8EA0dB0Ns4FqjUM59fHzrOV2VnmFsIxLh96vzkDaKLoyIby+EMpDZGHqMxOY8axZN9hq+JHLSdtJKbLYyP8zsefqyUzmfHGQdpDTMfbLA7LVS7m6pATU0DiKJUEBpnF8MPZa3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Tue, 18 Nov 2025 01:15:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 01:15:07 +0000
Message-ID: <7cc3ff01-1e39-469b-ab0f-0814e314d570@nvidia.com>
Date: Mon, 17 Nov 2025 17:15:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
 <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
 <20251118010424.GA1131446@joelbox2>
 <3665d524c89605169d5c283b621394158e0f6067.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <3665d524c89605169d5c283b621394158e0f6067.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: f7226024-d82a-43bc-5f34-08de263fe93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWpuVThGQ25HME5aZEhFU3BJWkZKRHJTYjRoeEVRTUtxaTI3UDBNT2tGU3FL?=
 =?utf-8?B?bGVUR3VycjkralFYY2gwYTJTWTJVVVFxVGRBVXcyTEpTVHV6YjhhKzdNUUdL?=
 =?utf-8?B?M2NYSmMwSEgzZ3U5N1JrQ0UrSmtpU2pZNE5LcmxpWmt2YktqS1lFYWMxcml5?=
 =?utf-8?B?dHdNVEhiOWpaZXZCbmNObmVRcGczV0p2T3pPZU1tYUpFcldIRWtYcEJ6RUVL?=
 =?utf-8?B?RWZNK2VrcHE3K1lhUzRlcmdhVTRqQ2Rid0NSdXloVFFRZmtaNGxQenpFVDRy?=
 =?utf-8?B?NmhlcHRCMXFEdEl3Z3NjcEpwODhhRWV0ZnFaaFNOTGR6TndrSkVLNjZVOWNn?=
 =?utf-8?B?eUxaSGNUN05MMklJMHpQN3VVMGxodlhXOVRrL2JTd2tlcFR6eWhJMWtpWW9z?=
 =?utf-8?B?MWVxcFJGUDNrUnRwWmxtdUlwYmI4OFhzVWIzS1ZscFlpRWtrcmI4TEJzVGZI?=
 =?utf-8?B?ZmxySXo0Wkl5V3BjT0QwVFVRTng0TXBoWjYyYTlublN3YW9GemhrU09PWkVF?=
 =?utf-8?B?Zm8zbFNvMkFaMm8wa0xpRFVEL3FYK0c1WHZSTldndU1vcUdzQnd1VExsV0Yx?=
 =?utf-8?B?NGpwMXNPcFJ0V0daZ0UzOUY4QUJSSUdNbkNkdThMdEwvcy9VT3JNNXdkeWZs?=
 =?utf-8?B?MjdXbE0zQ2pHenU3ZXR3NjByNG1BZk5JVGwzVGgzS1hDWFNXRTdkWS9SWmJ1?=
 =?utf-8?B?aVE0THpKK3lKcGhnTjFCREFmSlh6dDhJNFhTN2pxZkdHMmZXNlJqVzRFeWF2?=
 =?utf-8?B?Mko1emRqV2ZqWk8zOXgvd2FqN2RWLzZGdVpxdFJXaTIxSjNMV3lvK3ZYUDJ4?=
 =?utf-8?B?MkxzakdKc0huNGJFcUlRR3RDYktvblRsY0RSSWtDZVJtdEk3Y3ptZm05NWxM?=
 =?utf-8?B?aHptUDFTdVpvVVpaMUhacWZUaGJsbHpiT1psejBpMVJXbjRWTDdnaWNVdlBU?=
 =?utf-8?B?WHBxSzdhaDFtOWxsLzUrMTVlcG9uWE5Ic2k5aFpYZVN1bzRCVXY1dGJjZGtu?=
 =?utf-8?B?U0JhVHVlYk5XTlZYTUd1OHI2WkRib25nVG9Sb09xK28yRUwxS0pQTkdSOFhr?=
 =?utf-8?B?YmRHaFovUkVURzFlcGFyN3RiVC9aVmk5YjlsL2JpdXdoTUFGTjhCUkVCUU1r?=
 =?utf-8?B?aDMzMkpQa1g3NDV1a290RnNVekQ1Q2pJUzRZS0dsblVLd3VpalY4aFprWFYv?=
 =?utf-8?B?NkVzUWpSWDg3Wi9lbTZvczVQZHlkeFlncGtmMXlKZzA3cVJ3OThnU1VvN1Vq?=
 =?utf-8?B?Q3NBSFJ2VmEydFZoNG5EdTEyRGtsOEVybXN1NVdRYW0rdUl4TkEyR1NTUy9H?=
 =?utf-8?B?TWVJSExzU3ZnSWc3L01jNzRxakVBOWZlRFBsN3RKcytmMXpFNG82VVpSUlY2?=
 =?utf-8?B?YkVjK2laNms0UjhuQS9yU2FHT1NObG9xL2FiOGZYQUdaRGo3b3NLTm5iQTF5?=
 =?utf-8?B?U3pweGU3c1N1bnhXT1R2SXZ4T3FlVGNiMUIyVk42SGZwaXl5dkxRQ3lvQ0Z6?=
 =?utf-8?B?RW9Ia2JFQXdhUmJtSks4Qy9RUmV0WXpTT2NtSWdmV2NUTlVCVCs5NGdhQ1Zt?=
 =?utf-8?B?aVVyTk9USlNIeHVtUlRWbDRPSmYrSXFseVRHOUJRTU9jUmJMcElyTGh4M0pW?=
 =?utf-8?B?VG5RdUN3Y0pydDlrcVU5d2FkZFhtSytoUmpJMHEwQnJYdzFyeWc1S3JvZ1VB?=
 =?utf-8?B?WVI1anVhbVlBVWR3WXVnMCtLb0dtYU5aZEJ5REFCS1ZFek84UFZ4RFFvNFBP?=
 =?utf-8?B?Y251bE5qZlpDTFBhUnRrbzJmemt5SWJ5RERYRHdOWU01dFh4eXFPa0JHZ1Fz?=
 =?utf-8?B?Z2xCdjBJdUx5Z1FiOWFxTTFqaUJ1aHN2aGNuMmZrbno4RmExdks0dlRZSHZs?=
 =?utf-8?B?WENnM3d1TkdSdkdQLysybjZvUDNrUGtHSHB6VnBhd2pxU3pVQ2NqSU1qa1Vs?=
 =?utf-8?Q?r2lebUdQk01tSGyE+8i/Os+XXIdu1jvT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pPdjFyODUxUFZFRXI5UGlLbGJteXUwQUo3R1k1NHRjSDVGWjJ5TWMxc2tq?=
 =?utf-8?B?TWRMNTZ1RWxheWhad0NOckQzWUxiUUt5RnBGOUNyZUZCelFwQ1VaVUxjZFFx?=
 =?utf-8?B?bnpxQ0YyMnB5NWhyZmQxTWRIb1JyTXJFSitrR0wvK2hibXhWRnFYUXozWUVP?=
 =?utf-8?B?bENyYTE1a2g1YjBVQmtkbzRHTTRRa3R6RDAyVTNOcGFORDUvV04rUzVid2lm?=
 =?utf-8?B?NFJRR0pSakNZZGxNUXdDdzZicFJ2RHcwb042Nksrdmx0bVFQRU50N2FsREpU?=
 =?utf-8?B?eEV5a0N4Q3RsdTRHb3NXY1RDSkJuN2syN3hDL2w1QWs3dWl4aHczanFFTzFp?=
 =?utf-8?B?YkdQRjFRWTZuN3p2UHJFdzVWeVNsYlYvcXcwVnpsb01nb1ZJclU4a2I4VEl2?=
 =?utf-8?B?dkFOaEs2bWYyYnpKRjkzYVIwWkJqc0Y1N0RTWXB2OVZZV3AzK2ZxNnJQcDhH?=
 =?utf-8?B?ZGJ5bEwvSkZuTm5COS9uZGhJcGVjUWlpNjZtSEZXYU1LY0QybTZEN1RZKzhI?=
 =?utf-8?B?UDVjaWNTMjFQVk5Belh2NmlZek5kL1ZFZUxZSnlveWQ3R2RDLzUrZ0xlOWR5?=
 =?utf-8?B?aFhqbHQ0Z0hVbXE4TTBzWVBXVTJoTkZKUTRBTUtOZnMyc2doMjV4WUJlR2sy?=
 =?utf-8?B?bXdMbDlTdlFNM21VMFhncThyb0NqTDFocVdNdnpRdGZmNyt6YXdqYmJIQ21O?=
 =?utf-8?B?ZGxmWXNOaEhsTHRicnVsU3lobEY5elZGYlZZQnZKZjQ4azRMN205c240ai9G?=
 =?utf-8?B?MGx4Wko2VmxEcWhDck9zdnRETEx5MkFiNXY0eWdpSUsyOHJtN21OVk1zK1RO?=
 =?utf-8?B?QXZPSkZSRXBQNmlON0VzYzgxK3NVMjhMZElJQThoVkxBYzBsc0ZlOUN0dHRU?=
 =?utf-8?B?K0d4UDRqTXdFOElXTm93Q1pDWXllQ25LcXM2VENXcnZKY1pWdHBXelRVZWxn?=
 =?utf-8?B?WDFBTFFFaXF6L3pwc05VcTRDV2VkS3VsVlhMOEtZZTA4anRWNWh2NlFzQ0I1?=
 =?utf-8?B?aGFrSmlGcm1jbUpGVlQxY0lqR2JRMGxseTJkdzU2anFaZ2ZnenU0UFNDdU8z?=
 =?utf-8?B?ZVdlSXd5Q3RwQlVvQlUzc0J0dTFWaFo4MUJnUkhjRUx0eHNlckFjUW1maTkw?=
 =?utf-8?B?aUNCcHJ6ZjFDS255SWtVM2JmdC96a2hKQ1VJR3g3V2kvR3NyNUVFazVhUUgz?=
 =?utf-8?B?WWRzTFJZSERvblJSNmtmYkRuQ1d4TnJFbTlySE1oaHJRTk5JRFVaVXRvNi9R?=
 =?utf-8?B?d1AvZ0hEeUwyampqazhsUVJOZnV5ZVlTWUhOL201SlVxNVNrVlVXaXdZcmpG?=
 =?utf-8?B?M2NoVUVTUTVuQ1BnNlNIUEUwZFpVRGNzQ0E3SkthaHhJVFAyRDV4dHhtRVRQ?=
 =?utf-8?B?ajFyOUlqYjRSMGJBTWNSNUJNYVBmWktJYmg1Rzdtb1h4ekxianMxMnNndDU3?=
 =?utf-8?B?cnE2RUpkZ0pGaW5qWEtuSy9rWFc4cS8vcTdVYm9GRmdTUVBaOUowWW5tbWdY?=
 =?utf-8?B?RmpsMmgzWGtiaXdoOWRwRnBOeUVmN2dBTEZqaUFyK2c3VVh1Wi9WSnlabUtR?=
 =?utf-8?B?b2ZvZC9TR2Z4TVJob01qbDd2UXFOK0JXVHhGdHJ1eG9OVVdUVTZXanBCZDFp?=
 =?utf-8?B?QldSSVFtMkpkU250RmpjT25PbVltQzlOQ2sxVjRXUWc4NytxditMYmpsTWpu?=
 =?utf-8?B?aHlvTGN2R1VJSm1uR05xV0xoanJrZ3VmSzY2VnM3ZVJSUUNBY1VURncrRXdE?=
 =?utf-8?B?MDB3MXVyUXpSNU5hL3VPUXgxLzNNMzE3UEtZZGVEckhrVjF0TVQ0NWIvdERS?=
 =?utf-8?B?K0NSeTNlS0Zmc3c3MGNYQ054YndWQ0k4VVdoS0t1TG03RkFaTjVzTWRvaDFo?=
 =?utf-8?B?WmNIOFpmTVRxNUlYbkpoWm9xdmdnQldCOWg4U0xoeTY1S2JMVldDOUxmUUYz?=
 =?utf-8?B?WXhiWTloc3k0ZmxkWDlIdDdwTmNrUXdxN3VvZG05RDV2MFltVFUzMHJQcFNx?=
 =?utf-8?B?MVEzdHVVdmNLYS9SVmFiOXMxUk1vN3hMT1dmTG00RGtpNFdTSmZ6VTB4cXE0?=
 =?utf-8?B?SWpKOFR5Q0szN0hDMjhndUlraU9GT0pyMFVtdzNRZzdwaFBYN1YrNk5abkM2?=
 =?utf-8?Q?N5XNpuofSqBKFjCKsNfnT2uIH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7226024-d82a-43bc-5f34-08de263fe93b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 01:15:07.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtXunwvEqdLb/5sKqJqetNLdyyToDTiQPC5tXum/lJoQQyBOa6rHvYQXvipZ1cCR3TI/IVD1SRrtEiaNZPINuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157
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

On 11/17/25 5:06 PM, Timur Tabi wrote:
> On Mon, 2025-11-17 at 20:04 -0500, Joel Fernandes wrote:
>> I don't care about the if/else as much as I care about the opportunity to
>> just specify FalconLoadTarget once instead twice. I think the match here is cleaner for this
>> snippet, but I am Ok with the if/else as well.
>>
>> Something like:
>>    imem_sec_load_target: FalconLoadTarget {
>>        src_start: if chipset > Chipset::GA100  {
>>           app0.offset
>>       } else {
>>            load_hdr.os_code_size
>>       },
>>
>> That would be one more line of code, but pretty much the same.
> 
> Interesting.  I would have thought that duplicating the if-statement is the higher offense.

I think the use of traits here generally makes this all a little better
overall though, don't you think?

Traits are easier to read and internalize quickly, and easy to maintain
too. They are yet another way to make implicit rules explicit and 
self-documenting.

thanks,
-- 
John Hubbard

