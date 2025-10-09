Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BFBCA954
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 20:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DD210EADE;
	Thu,  9 Oct 2025 18:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hBqgCEfS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1D410EADE
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 18:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsKu1k1fkzLGaHAI1DAz2JG8bSJoIdbhpweK4qdOC1dyc6sNEGX5Pv95sEevqJ1vx/XESVHPYwN/Ucx+WA0wIqR82mPbxajMqSo2n+2UIm/JgL4Sk6fNjlvp9r7RdSd/H5SBbnsUSMBeJ4z8U4gCZ7driCcS5LxhAjZg9hrpBVgdJNalZC2NU7uA+Ao3E/NvW8+M5HCjiCJ9j6MmHOQhEzLUfH51zwgPV2Cs774C+CjHfdYu/CgsSiFsdvxSOcMidTBW5lmo7Q6BFETgbo1Ns+k9rkvUEBRytcwFvX/p5bVPOa4ppzjnJW64icZdS/pPnSWYn85VgGwW5sSMxhTBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2hgVx1FcbQsm23lGeMfrGhJ8N60Pqbabduzi3e1Uow=;
 b=v1LZlxaZKw6csZ+ekZ/ddf6AJ2IOd9GNDAJfCug2rJSLA7kcCdD4E982OODcJd2zeSzUyXdCWGMsVVbOCQFi6LK7jjozmhrhsvQeWzwy1aPwGumnFPh2wtis1FF5cIao3RbsEeOgW327sdYRv59yj83EQOG+N0CZ4D8k19hFXola77btLt0f8vJre0FsXZs187jzK/Vf8MQ59KiZfkDBMAGXpAaltQJPqcGAatE4qDgtWa8GhU2AHK+9Gbu4tJvdBQQ/NQnGfeAdtkYVzorNWTWNqL7LBsadm2Q0e6r9NcR1usfLl2LRXTEObYCh7R8IpJrtWYQbJbvJN9g/kr4EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2hgVx1FcbQsm23lGeMfrGhJ8N60Pqbabduzi3e1Uow=;
 b=hBqgCEfSfl8uPRvJkRPsIBWi5EJwU/Nr29iaf+IYZKjsRk8SfWpNTRyjholrvVOHQUj/gJUBiKTbc81d58s9PfU6yF7aAnd+mppHR0sJ3qN2eve898LMwoiz/YboAQLBQwmToM8Um0Xh/HY4mftEhCmumyV1N6FYtvHfkQdZ13xs0xXhLHoqxFMZjmlwgtB3Sii6o2hTCIOvflV/dPgUQC3IFZrE4miUOokc07u57IqAqk61Qmz3gMpIJaHub5bSBqqjaLsToIRfB9c89OQeTDQG9Cl/ITWV6By4ckL4KCESNYaAiERV019MfPJ4gWnMCq5uzo13U2PO9k9RRcc1og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB7010.namprd12.prod.outlook.com (2603:10b6:510:21c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 18:37:35 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 18:37:35 +0000
Message-ID: <b3842ced-c3f6-47b4-ab17-02e7ebdfe7e6@nvidia.com>
Date: Thu, 9 Oct 2025 14:37:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
To: Yury Norov <yury.norov@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Jesung Yang
 <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feong@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com> <aOflmmHe8O6Nx9Hp@yury>
 <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org> <aOf-s-XuhbN7MUlx@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aOf-s-XuhbN7MUlx@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0316.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a6f2ae-77f1-4046-3027-08de0762ea23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnoxejZzTVFLdFZGak1mdXM5NzRLQWtnR2hpakhqK2hESTltQUdvdzZPY0sw?=
 =?utf-8?B?bXdSb2EzLytIemYzREN3N1NmbE1ReHYxWlB4TURETE54Q2twMXQzRnVVZzNJ?=
 =?utf-8?B?RVpOTWNvUDd3ckwyamlsMXdaNFIxTWRWZExWcURCbGpzM2d6b3VLcE4rTXdM?=
 =?utf-8?B?R1Qwb0pmTlQyMm1LNFBNTTlHNXVkSzNrR01zTXVUUXlZdTBlS1FvOG12KzJR?=
 =?utf-8?B?bHpBZDJYOVh3WWhJdzMzRDhVNDJZSFNJZW9JeFhBdDhFVG9aLzR5ZjUxVk9Z?=
 =?utf-8?B?dlYrUVZuRUgyc1ExSFg2WTdMbkFqUzhrdytLb2p4MmluVGtDeEswRE9aNTMz?=
 =?utf-8?B?WHRzZXliVzUxMUF6cHlJT2pheTh5V21UTmJ5aG5GTllRUkRkUVU0WHdZNkxG?=
 =?utf-8?B?N0wwekJYbHp1K1BWMFNxNXRHTk91UzNIbnVnbU1LdjRwWUN0TTRsWUQvVHNO?=
 =?utf-8?B?eWlmYlVxSkJSU2V3K1k3T2RqZG14cGFzT2lFYWh6OGIvc0xBVy83dGVsdW51?=
 =?utf-8?B?TytDNFBpVkZSb0lqcnBXNk9oMDR0Yk1tV09QQzcrL0h1ZzFqYVNWd1RLOWsw?=
 =?utf-8?B?VS9KcE8xbTBIVGlBdm5yWXdMV2QwbW5YdUtJS2dqVHYyRzRJc0NQS3hwclJU?=
 =?utf-8?B?YnZseXhpYkMrQWpQRWo5QXdRVEtJRm9JM1A3aTI3Mk5jQmdad3ZpZTE3OEpS?=
 =?utf-8?B?ZmkxWVpCTUQrTWcrcUdHZkFVVEx0RUkxQ21sOUZ1eU8wL2RLbzl3aHFzOEo1?=
 =?utf-8?B?ZVNwYjIzRFcvUjkvK3RTL0lBV1ErYXFiMUNtUEVUaTBSRDlRYk1MdnFNdDFH?=
 =?utf-8?B?V3lrUW5jaGlvbWRuQTRXdjlENVRvVzg2OHUxdTgvRWtRL3BOeDZ1KzA3c2ti?=
 =?utf-8?B?cFE3aVNMd2tVTlNkb1hYUllJNTlEYm1LQys0ODhabHBQemFCTnB6dHdxR3cz?=
 =?utf-8?B?N3orbmx3RjhPQWFVREhoM2xJZDRYTDRwQ1lmdHBZMGlFdzNQdFIzeWJsYm1a?=
 =?utf-8?B?TC9NYTI4VUVHU0RHUVV5OEw3TGNlbzhEOTR1U0NoSzBzbUpiWjBEVUlXVGNs?=
 =?utf-8?B?OFNwWm5ySnR2VzZhNUQ3WFI2dHJMNFFZbVh2ZjlXbk1QaElFZ0pKeWMzNVk4?=
 =?utf-8?B?bW1acmxjY0VnWG5RcjBrLzY0d0xGeUlTbTZZVHZ2MHZxbDN1L3VNYzcvNmFZ?=
 =?utf-8?B?bVAxU3lIQ1UvR2FpbS9tVUpOWEtZVDZBTElFTlZKR2t3NXZOSDJCdWNFMnVz?=
 =?utf-8?B?R29rQnllWFdob21RNzFkNEh0bUNTc2s3RXdtVEs5MFN0S0J3SDJnK2JoeG5X?=
 =?utf-8?B?REdQZzI2QTJYM010WE9VOXFNWnRidEJKMENKNnJUd3liS3lPVlIvbjl1NjNR?=
 =?utf-8?B?dW53MGs4ZnBickhmbWp6dFFMa0FRM1UyL011cDYydzZWZTRjK0tFdWwvOEdw?=
 =?utf-8?B?a0QrVnV2NXVzcGdldWJYdzN3bUR5alJCcFg0VEpQZDZYb25nZjBrZ3c5L1A5?=
 =?utf-8?B?aWNHMXZENFk3dVd0WEE2eE4rU3dHa1lTaFBDRHE5REVuekhKWjFXSUd3akxl?=
 =?utf-8?B?MnVJOStYQ3FING9CYXA0Vnd6cENOLzIwSCtlaFlyN0V0bG9SMEd1ODd6ckFk?=
 =?utf-8?B?dXVIUkJZNVcxWlJqNkhYaDMzdlpWLzVNY1RkUXI2dUlJdEloa3UrN29Zb3Ft?=
 =?utf-8?B?RmozcGFEMzVRUlIvRnJRL2tBL1Jxa25FRkczY3ExcEg5OVRQdTdwbW8wWUZD?=
 =?utf-8?B?VGRLTzhWRUNmaHpXb2k1TnFIeWNLYmJubm9UdEhoUWg2M2t2eU5lZTZxbWRv?=
 =?utf-8?B?djVFcGtKSXViZE92YlY5QVdPdGxBVUd0Vkw1ZFhjWVNYTWZDNmVDOFNOQ2VE?=
 =?utf-8?B?WlNVb1UwRE9mc3pNSXdiVzhnOVVYL1RaMnJqb0NvRkVmaThTNGRzRG5DRFM4?=
 =?utf-8?Q?bl7h9MZI2lZXuq62QCdQnACcellHRQpk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlhlcldmZDFiWGtLZ2VUamkvMXpPWHUrR0hsclJKbHU5cXVEMXI2SUk3c1JL?=
 =?utf-8?B?RzNENjR6ZUtlQXNXVWRKZlJIWEZrODFyMHh6aDVxVU5JWlZGdE1uRzVPN1gv?=
 =?utf-8?B?czBmelgyRCtidGQvVmh4Um91VllvdnlGaG9ldTA3QkNyT01ScFJSNFhnMlFw?=
 =?utf-8?B?RUNtNGpORE5GOUJjZkk1Wi8xdjhCMkc1YlI3ME4rNkZpYnB3aUFteWN2WVJ6?=
 =?utf-8?B?ZHNVNnlYeHdCd252YU9hajJuYk53N2hwZHptaTRGa2c2UDVlejVVdDBmbU5h?=
 =?utf-8?B?M1lQVVBOS2V4c0J0V0VOT3ZyWGdtMnUrS0pFamlHWGhuaFJKZitEdnJoRnhM?=
 =?utf-8?B?SGZla0ZyeHlaUVk3Tk5wYlBrUnd6aFFBVDdRMW93UmtiY3pja1RCTFppTU0x?=
 =?utf-8?B?d3ZscFpEajkzRnN1eWRmdEF2QTdQdWVSODh6RzgwZ3RyOC9KS1BSQ0NTQTB0?=
 =?utf-8?B?RGwweUpCQjBaU3p1NzdtcXBPVnZHeXRXTFVqYmVma3dCYzJEOGFwLzY3OTkv?=
 =?utf-8?B?Yi9WQ0pEY0NWOGgyUmNlK3QzYjZmTlc1Z0grRjlHanQyQ29DTis4eUNsSzJL?=
 =?utf-8?B?UFJIWWFqNGhVbk1YVEllenl0VUNTTEJBMDNzZ3RNRCtDNG9wZ2MrS0RCM092?=
 =?utf-8?B?MHkybkF3dml4N01XK3FGUERoSC9EeHh1dW45T0xCVWYwdE9NNkozVFVoMDNr?=
 =?utf-8?B?ZWFWbFJQaTZzajVKRXIyU1JUUWJJbWJMT0psU1NVaU1BSnhTcmJ5d05Kc3dn?=
 =?utf-8?B?Q0s4WmJrZG1SQ2lldFBKckIyUHRNUmpxYkdKbWJ6Z0hRYlNsS2xsN2wzZm96?=
 =?utf-8?B?eDZxSVVYYlJFNGMrNGtJN3ppU1U4cWpCTmhVRDYrSVFNbnVxWTlrLzNpSy9m?=
 =?utf-8?B?cW9UTkxOWnRDS1RFd3oxQUU1STJ2WHlTUCt6di8welM3eTRvWHlscEFzTEw0?=
 =?utf-8?B?NlJiYlhjNkVVQm5jclVjbzFhaDFzSWZGOFlRWTB2azcrRnRqVFozaHBpZFpP?=
 =?utf-8?B?WTFqNTl0N1hhNS9OeURGUWEza1RabWRqRGIxVmRVMHBhQXRXU2tvbk1HckJ3?=
 =?utf-8?B?ZTVHUEJJaUJsREI0V2FOSCtCeUdhdWhZb0taekY2cmlpL1R5N1FqcVZPdmRN?=
 =?utf-8?B?Wlp5SDJwM0dBWHUvS05pdGRoWER3UTNKV1E5d09Nb3VGOUpCUExTMUJWOFRY?=
 =?utf-8?B?K1RFNG9sUzAxQlI0OTU1UjJkTy9HeFlReVFWR0x0N1hYeFRVcnBrYS9hcFhz?=
 =?utf-8?B?U29CdWhpQmdmcVVJOUk0TGY1TFg4eERrcDlmRFhFRHN3bjFNeTROTEpHa0Z0?=
 =?utf-8?B?ODhtSTZFZHZhSWVPdXM5eGtTOVM2YW9PL05GT0hBaFZ3Q1Bma2JXUk1LQnBU?=
 =?utf-8?B?S3o1ektjU1FCWW8vVVlQL3cwUGZ4ZFBvU2R1UzRFSkZpQnJwZCtuUjY4UnZ3?=
 =?utf-8?B?QzB3WC93K0hYSlJhNXAwdlZUczFJYzZNblh1ZXhhMEFnbVNjcVROQksvMS91?=
 =?utf-8?B?VWZ1TVlEVXZBRExaTEt2T25QWjBQSkVpbzF3dmd5d25TRnBzbDdHd3NsQlpa?=
 =?utf-8?B?U3dkNjFxclBmN2huWTlZR2xUNTFHYmdNS2RzWHdqVVdqTnRtMGxDY2d2d2Jk?=
 =?utf-8?B?OHZ0ZWExOHEzcC9ScUxHUXQ5YnVtMTc2SkhESDdlVDcyMDg4aXoxMkFKd2FC?=
 =?utf-8?B?cTFLMWRJT2ZtRU5uZ28yNzNXTW5hUVlmZVVxWjd4Y1poVGo2YXJaOXNtQmI1?=
 =?utf-8?B?Q0VPblU2UVlRS0dpUTFmQWZlV0d0RW5oVmxPYjJBeDRJU1JDWXVhMmt6aXRJ?=
 =?utf-8?B?VUZTazRyeTBieURCcUxBR055YnhiYm1UMXAxQjR1U0RTOENhd2lEZWs2SnFv?=
 =?utf-8?B?bk85aCt6TGEyL29Vcm1BZjhYdkdLRWg1ZDVtUTFrK25kQjFEMFdTT1ZqRHA0?=
 =?utf-8?B?Q1FJaHhKbTJBY0NsaExjQzdpcW5MVWNWYzRWd2Vra0ZoMlNMKzZUNG0rYitq?=
 =?utf-8?B?bk45ekkvMEpSM3AwZHJhS2NROHl5ek85VENqTU56Z0JTUnE0MkYyM016dnZQ?=
 =?utf-8?B?YnI2SHJ5Q2lZQUVEc3hqTUxvUFRlSGFDVnJzRjBFQnRhLzVFYlZSTDk1UDJz?=
 =?utf-8?B?Y3JyaTZZUldReXNzUWFXU0FDa0F6T0xLenhqTUt6YlpQSEFwYlFCVTVXZ0Ju?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a6f2ae-77f1-4046-3027-08de0762ea23
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 18:37:35.0708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlP4Z43xWKnVMvq1c3Bkh8L2RheAZizfWSJK6SezLztgFNGwK+05BLslG+yYP81IIqiUjN98GFjZ55JRsGNXsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7010
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

On 10/9/2025 2:28 PM, Yury Norov wrote:
[..]
>>>>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>>>> -            .set_base((dma_start >> 40) as u16)
>>>> +            .try_set_base(dma_start >> 40)?
>>>>              .write(bar, &E::ID);
>>>
>>> Does it mean that something like the following syntax is possible?
>>>
>>>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>>>             .try_set_base1(base1 >> 40)?        // fail here
>>
>> Note that try_set_base1() returns a Result [1], which is handled immediately by
>> the question mark operator [2]. I.e. if try_set_base1() returns an error it is
>> propagated to the caller right away without executing any of the code below.
> 
> Thanks for the links. I am definitely the very beginning on the
> learning curve for this.
>  
>>>             .try_set_base2(base2 >> 40)?        // skip
>>>             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
>>>
>>> This is my main concern: Rust is advertised a as runtime-safe language
>>> (at lease safer than C), but current design isn't safe against one of
>>> the most common errors: type overflow.
>>
>> Where do you see a potential runtime overflows in the register!() code?
> 
> Assuming base is 10-bit,
>         
>         let ret = some_c_wrapper()      // 0..1024 or -EINVAL
>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>              .try_set_base1(ret)
> 
> Or maybe I misunderstood the question, because if there's no possibility
> to overflow a field, what for the .try_set_xxx() is needed at all?

Because 'ret' is a value determined at runtime in this example, there is no way
for the compiler to know that ret will fit into the bounded int, at compile
time. So the "try_" means it is runtime checked and validated (via return of
Result). Sure it may well not fail, but the compiler doesn't know that.

Thanks.
