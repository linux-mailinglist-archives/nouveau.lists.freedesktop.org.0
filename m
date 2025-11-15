Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D06C5FD0D
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 02:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0B010EB58;
	Sat, 15 Nov 2025 01:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ndjdQd7R";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC38D10EB58
 for <nouveau@lists.freedesktop.org>; Sat, 15 Nov 2025 01:12:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he6nNmKfBrq94vZQPmuseWt4sQ6WFO2NyJ9/cj2+gyjz3NdVfwLtY3TyfX48H6Io6nfBdFVsRn0eFqfPb/zqI9NEfEeZwunHmI5lY71C6Iv7Wut05EYgF4eU0j7v7Y6q2Q2Gg0Md2jcT2mDFtJQpG1AcbN1E75gxf2NLfupcKYnDEeI72pPG/n8e8cgg9CXyVJXYA/cOkbWT4dt9qpcv1sJw5eAydOcsd7dsEAWhcJWUQDmqNv0MFzIPZZXcs/FpfJjxDJ/7r233tCsXmZ6vvvxaSOmTFbIDX32eC2C0uEqlPT2u9Juzfs6HoUoWEZveOLQ7M3feNGlhHx6kmD1XBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym1d68QUArQjCB1P+2I22ARMEDpe6kcuOHxNxvRORtc=;
 b=eNmIhVvVvt0jQMzr3jdhSpcZGYEH56HDnLU3twQyjiNUOeINaq05U+LL4ChHRRoQdQadX5FybjbvGvbpyr2+FB62rLKDlWLI/WUhyogufM/CNDDDPilv0nNZBffogVZmVB8pVYuIB2b3jix8leCXfAoVqYtro7p8wfl/7yZbi5BnOM2da+YUiSt+wnVGcrrQxRzDmi4KaCEdLCTfuGgZCLiWWlPlafqu7ypdd3k//0CSTAm5V0eWxkFWXM/aTdjBVStDRd/vKfZSRHu6v7aAh6F/Oww4USnVeWdaSztw/kEQlp/DXXy2TbomxyEr/5aG3W0GPRZti2iDHxtj5HIScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym1d68QUArQjCB1P+2I22ARMEDpe6kcuOHxNxvRORtc=;
 b=ndjdQd7RQkFK5ELKip4EpvIdffnCbFdHWGD8dn0NLo8c7I/XAhiETj2mQwyS8KcqUQWLsA/TYyiGjr570zTZf5b0nluQj0bdDkbXGz3ka0WC5HO+XvTtKCLCMg2MyxSWyl7oWWbfYcvv2/ak2hqfmPuLT30/k9TtLM88ZYp0r5opQuI0qiGdrOP6FQS54XvaB7xQxMBV5O/TZ/6efiPc2F6ueFBoyzjpfs78zmsvLXl6kIssN0lHgZ6ioaVYB6o/zow3R4JOlwjh5fn/mFU7JdtZVeIbSBrbLdWQtpG3vwZz7AXs7uPd5iAXTtxcCVOZGDH4NGEK3lR7dc7acGVcag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 01:12:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:12:41 +0000
Message-ID: <a467f1e6-4e18-479e-a165-68a5b5ea5db8@nvidia.com>
Date: Fri, 14 Nov 2025 17:12:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] gpu: nova-core: provide a clear error report for
 unsupported GPUs
To: Danilo Krummrich <dakr@kernel.org>
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
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
 <20251115010923.1192144-5-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251115010923.1192144-5-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 16198f4d-89f0-48ab-b54d-08de23e41359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW15dTQwckJpWk42aFoyMWFKMTIvQ3RCR0JMNms1WG9GcE5vMFlGWW5PaDlm?=
 =?utf-8?B?YW5ET3YzcXlEcVRRcFc1QVdETjVOdzNrMXRSN1F6aGR6MFpRdHg4OVlZdlR3?=
 =?utf-8?B?TXVQUXFJVmpleCt4Vks3UDdhekhxam1ndXF0TlE0b3lzMHpFRGJzY2NRblhV?=
 =?utf-8?B?NW9kZU5XTkJaZHo1dnFaN04xRjBTVVVmZVQ2SlJDUktSMUFzT2JkT1JEMFFB?=
 =?utf-8?B?bkw0VGs4M0dDMUtxcTNkQ0R5ZjBYK0F2ODVzU0FaZ1JjUHUwS3IvNTRHR2dN?=
 =?utf-8?B?Q01FL0dyYVdhN0hVSzl4RmZQZ0c5dzY0K3dlc2x0WlVtc1NsVFFXekxpY1cv?=
 =?utf-8?B?Y0p3S0ZUSkhHTWl1L01SWnlqbjZFeU84T3hOc2crWUFKaUNUVHFnU25yQjRn?=
 =?utf-8?B?Q1VKV0tUWFAzVFFoamEzeUVza3YzTWNjamxlcUxQMTJLSmVXU1YxQ0JEUUxy?=
 =?utf-8?B?MVEwVFlSUlFITWI1dFUxd3IzNDUrT3RERzFDZG9DM0g0QlFia3liWkVJb1BS?=
 =?utf-8?B?cDJ0VG04ekRMMnVRS3FPQVVHKzVaRVFuandMcXd6Rms3bzFlYlVGRWl5NExa?=
 =?utf-8?B?YURYMDlsWkhKY2ZYSVRjczdEK0JTNms3UmFWNzdBcXJ5OEI3eDlhM05yc3A0?=
 =?utf-8?B?Smh1b3NPTlZZVEtFdlRGQVBCVGRNWDNjZ05zMU9MRm53UXExWlNPT0dzQzZn?=
 =?utf-8?B?emk3RGZwWmY3a0VDSks3Sjc0UGQyV0VKd1BxQzJUZ1ZwYmp0bENYMUNLdTZC?=
 =?utf-8?B?RFdQQ0dtU0kyU2J4NnBnZnJaOFlSSlhyYkJrU0xBK0RLYk9hQ0NJL0d5UTVB?=
 =?utf-8?B?ZzNRaENFZXQ5cFg5bHpkUENoSDJzU1E0QlBtL3B6WVd1Q0hta0x1ODJTQkp5?=
 =?utf-8?B?MnBDQXhlb3J2aXZwNlJ0NGNkN21BK3paampQMFpQWnZHNVdDbldUazRQSWtQ?=
 =?utf-8?B?dVd6NFltTk5LSTF6bW1qcW9KNDdSaitYVmg5c1ZmZUlacmh5MzdSSzQxbWI1?=
 =?utf-8?B?bkJiNS9EZXhaR0ovQUcwNUZ4OTFsRkZUODN5Zy9XSVZrNzhaT01uY2h1aUpJ?=
 =?utf-8?B?SGdCR2NFNEFWbEVMUHdVTzNzSmdTN0x0bFdDK3dPTlVWTk9Cd2g5Q2ZaZHlx?=
 =?utf-8?B?OVViSHRITVR3WTNEMXBud1VkVzNkbnA5ZWtXclkxVk5Nd3FzYUdxb2JiTnVN?=
 =?utf-8?B?NnBOaUxxQ1ZNcEJSc1ZBZ3JQcmZQSVFZOExmMDZHVXpFY1FEelhlbjMwc0V5?=
 =?utf-8?B?KzkzSVk2eFR2T0JKMnhsTXVzK0pzUTNRRGtCQnVPTStJMUY2cGlZbEFkUEto?=
 =?utf-8?B?WmRPVUVtblR3NWlxZUh4WGY2T294WTJSSjk3bmU1em10WW82UlEwM1UxT1Jk?=
 =?utf-8?B?MkRVNVp2TzBCaVMyZnNsQW51Y01xNHlyL0VwR3B1ZnJLV0NCbFRRQ21jS0JS?=
 =?utf-8?B?M1JKTERMT0FkRUVHR3lYd253S0xTaGpCN1o1b2RJRkFIYWoxTVo4dDhHZjBI?=
 =?utf-8?B?ZFA1ZWE3dGZTT25tYkJhL2Y2clJPVUhZUk9iOWpkODhMcmhISWozMDJMeFRO?=
 =?utf-8?B?MThVeXdnUDVBbi91NDNSSWoyd1B1OHpiZXNRU0pIY28wNCtJdXc1SWo4VlNW?=
 =?utf-8?B?Um1UVFk1Y3prR1dPN1hUVGJkaUVkVHRnSDNKUm1tYnQzRlNTUURWZ2pDUjlp?=
 =?utf-8?B?U2hXaVJtUjIwcitPQnBHcmxmU0hQNlhnMmxvVVpqcDRIOVR0NlFHcXBTeXNu?=
 =?utf-8?B?RzdSd0FaaXlUbG1uU1FpOUlkSFA4NUhFZmVDVzVOMGJBMGhPaUJoemZZRCtn?=
 =?utf-8?B?YVp4SGZCcXF5dE1YaUpVT1lscUI1dVdFTEZwL2hEZkc4cGdQanp6aXM5OTRn?=
 =?utf-8?B?WmxydUlSbHdTblozbGtVL0VaTlVXbTFGd1VoY014Uld6NDJ5SDkwLzdqSmNq?=
 =?utf-8?Q?nBhSjs0+8E16bFgdmQF7sM3mcPG1Rp+R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1dxTXRnZUUySlZ3S2dzd1VtNlJvTFlsdy9ON2oxVmFOYzdaUWprbXVEN1Rl?=
 =?utf-8?B?Mll1MzNQQnRGcHl6cjczcnVyb3A0SUpmV3lSanBKRTkvcjFpUDFMTmZCWFpE?=
 =?utf-8?B?Y3NvL3dCVmMzVmxHc01HWFEyNDU2TWZxOW05NGxtTFd0TTFKMFhMTkRmVXhN?=
 =?utf-8?B?cEViZE1STDU0WFVFN2xuZmJoZ2hKU2llc3dCU1VBMzdzczlMcU56bmFocmdu?=
 =?utf-8?B?YUgzR3JqNVFwRk93QnZERUN1Uzh3VjcxVDZvbjNUbkpOMnJEeDE1Y3lUaDYv?=
 =?utf-8?B?NUhuQjl3a2JWRSt5MUVhNXJoNzlnYzQ1encwQUQ0QU54Y2srTFA3VytxdWMy?=
 =?utf-8?B?ZXNJMWg2L1FDUTkwSnN0UEU0S1ZzQTkzZ2VjSlNNeERsMk9jVEdFRXZqQVpB?=
 =?utf-8?B?WUloNHhscTFKWUZWYkg3NWxHMjIvSXFCSWpRaTZKTjlDM2dKRzZnT3pqOXlw?=
 =?utf-8?B?bDhFRFNPamZLOWhPMFdoVi9NZlRxUDZnbDdybTc4SW1jTTY0QktmOFFucFdz?=
 =?utf-8?B?SWhxWmo2UmdNb1RWUzZmZ3JRMlA5cTY0VHdDVXJUVUM0czltQ3lMY05VamIr?=
 =?utf-8?B?ZnFWckdWZFJuck5MS1ViRXRlVzlaRDR4eWw3MThVazZhU093cFFBcHR5M01N?=
 =?utf-8?B?ZkZ6eHpveWNMa2MrWUlQay9rTU1oOHRpMFRZempTT3owSTFIdXFXcWhMNkZ6?=
 =?utf-8?B?MXY2czdRYjRsQWtWanczenhoWllrcEtsUjZwbE45Rld2ZjRGemxzVHN3REJQ?=
 =?utf-8?B?TjY2UzI1cUs4ZFBBQUVzS1JZNXFzeC9yaVJka05mNUU2bkFidjFKRlRmREM2?=
 =?utf-8?B?eUZSTUlxTmdEVThNNzVtaSswOHo2SmJKL1YvK21MZDlKUXphRkttQW1icWVh?=
 =?utf-8?B?dXhORm5TMDhiRllXWVp1VU1nSHNjRkhHMURya2MrSjVUOTlQN2NPUkJkM0ow?=
 =?utf-8?B?NitYQ1ZCSFptNlVWMlRYRHhEdXB6Tk9PcU05V2Z0K1k3YzNISHpEeHRES1JR?=
 =?utf-8?B?SWVmSk1vd0d3MS9ESVhIT090MVM1WU9GRUtDZmdDa3pZUEw1ODlQeEVUZnpW?=
 =?utf-8?B?dnR1dlhqRnlYdHhDVUZjaUFFNGNHMEViMGhvZzB1UDB1UVk3cUN4ZVp4ZWhM?=
 =?utf-8?B?WWNSN1ZMbDd2ajl5bFZVV2NLMHRQZFcwQXhibENNNnk4ZlFCVG9xTlpNK2wr?=
 =?utf-8?B?cEdER29lV2pDeDNmK2pxc0RiLzRHSkdzMk1iY0VwRkpFeHowb09pMHVLMTdZ?=
 =?utf-8?B?eXB1dUZ0Q2FGbFVGWkVQMzh3MjBnZVU1alZiRFZPUTZYdGVuV2RDNXM0aVBM?=
 =?utf-8?B?WUltY0JzYUVjOU0xTXRvaThxMW4xVVoxQWlsWHNrUzhCZHg5dERCUkpoTHpw?=
 =?utf-8?B?OERlanlWU0x1ZE1oL0FYQ1lyckl4TTg2a2JkQW9BUGJqQ0x0ZWprMXpWNzhv?=
 =?utf-8?B?ajdYWnpoNGtzL1pXM044eWxCeXh3d0NsOXd0ZjJZN2RlUi9OaCt2RXpPUmg1?=
 =?utf-8?B?WllSWkdyd0ZJNjA3OVBaaDNEY3lTeU9ZK2xPODIwSVd0S1RkWHIxeWtSVHRp?=
 =?utf-8?B?U2t4Sk5CR21qTnY5azAvdEFtK3VFUmREZGMxbGJyWi9ibXpGa0xmNjhuVWFU?=
 =?utf-8?B?NHhsaWZoUTVSNm1leVphZUoxMjVkbm1CZEpGS0NPUW85UzdwZUpRdDFzR3By?=
 =?utf-8?B?RithRWQxMGlCZlJNZkgwcjBJNzZzWitRdXZaMTZaMjd5Z1VzZi8wN3lLekpl?=
 =?utf-8?B?eVdvdituNkN6cTNyWDBOMW1GMmZwQTluYnpybEI5N1padWp5bmErQ0xWRVV5?=
 =?utf-8?B?Visrc3J1Uk5qQzB6ckR0OU5Cd0JyWFUvQ2V0SDZlYlZ6bExrdlBIcktqTU1v?=
 =?utf-8?B?TGY5WUgxSW5uN3VVMnB5MnFkRDduQThoTmVoZlhrU1BwczgrVHBnQndNVDNH?=
 =?utf-8?B?N0FwVU1LSDVtdTBxQmpqNmFNTzkva0dmNnlYVkFDcXFIQU5tSktUZW9hamVi?=
 =?utf-8?B?Yk1UL0Z1Q2FXYUE5TlR3YmtQeHVYM0hhb3VqT3JVRWtZQ3ZVNEVhL2RFNDVF?=
 =?utf-8?B?RXlOb2Y4aTREN1NINTcvMzc3V0UvT1JoVEFJMGhMYU5IdFJnV2Ezc1NlTXBG?=
 =?utf-8?Q?pVjqhXcZcqbxzqpL/cSB3GVxr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16198f4d-89f0-48ab-b54d-08de23e41359
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:12:41.8979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvrSJoPViLWgbzNpSqlSeWEt/aZ43UR35+9mWcVFxEvcB7LpN/qvzCR25NkB3ApU9RnZ0LtmSBc/cq35tJL/tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
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

On 11/14/25 5:09 PM, John Hubbard wrote:
> Pass in a PCI device to Spec::new(), and provide a Display
> implementation for boot42, in order to provide a clear, concise report
> of what happened: the driver read NV_PMC_BOOT42, and found that the GPU
> is not supported.
> 
> For very old GPUs (older than Fermi), the driver still returns ENOTSUPP,

ENODEV, actually, now.


thanks,
-- 
John Hubbard

> but it does so without a driver-specific dmesg report. That is exactly
> appropriate, because if such a GPU is installed, it can only be
> supported by Nouveau. And if so, the user is not helped by additional
> error messages from Nova.
> 
> Here's the full dmesg output for a Blackwell (not yet supported) GPU:
> 
> NovaCore 0000:01:00.0: Probe Nova Core GPU driver.
> NovaCore 0000:01:00.0: Unsupported chipset: boot42 = 0x1b2a1000 (architecture 0x1b, implementation 0x2)
> NovaCore 0000:01:00.0: probe with driver NovaCore failed with error -524
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  |  9 ++++++---
>  drivers/gpu/nova-core/regs.rs | 18 ++++++++++++++++++
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8e04628ca3d9..2bbc084e2095 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -191,7 +191,7 @@ pub(crate) struct Spec {
>  }
>  
>  impl Spec {
> -    fn new(bar: &Bar0) -> Result<Spec> {
> +    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>          // Some brief notes about boot0 and boot42, in chronological order:
>          //
>          // NV04 through NV50:
> @@ -216,7 +216,10 @@ fn new(bar: &Bar0) -> Result<Spec> {
>              return Err(ENODEV);
>          }
>  
> -        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
> +        let boot42 = regs::NV_PMC_BOOT_42::read(bar);
> +        Spec::try_from(boot42).inspect_err(|_| {
> +            dev_err!(dev, "Unsupported chipset: {}\n", boot42);
> +        })
>      }
>  }
>  
> @@ -268,7 +271,7 @@ pub(crate) fn new<'a>(
>          bar: &'a Bar0,
>      ) -> impl PinInit<Self, Error> + 'a {
>          try_pin_init!(Self {
> -            spec: Spec::new(bar).inspect(|spec| {
> +            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
>                  dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
>              })?,
>  
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index c6e2e08c754b..a53b013f2eca 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -67,6 +67,24 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>              })
>              .and_then(Chipset::try_from)
>      }
> +
> +    /// Returns the raw architecture value from the register.
> +    fn architecture_raw(self) -> u8 {
> +        ((self.0 >> Self::ARCHITECTURE_RANGE.start()) & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1))
> +            as u8
> +    }
> +}
> +
> +impl kernel::fmt::Display for NV_PMC_BOOT_42 {
> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
> +        write!(
> +            f,
> +            "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
> +            self.0,
> +            self.architecture_raw(),
> +            self.implementation()
> +        )
> +    }
>  }
>  
>  // PBUS


