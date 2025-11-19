Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4040C6CF67
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60E010E227;
	Wed, 19 Nov 2025 06:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PVbTkkTy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012055.outbound.protection.outlook.com
 [40.93.195.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961E10E227;
 Wed, 19 Nov 2025 06:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5iuFAUgBDkk7qdxvnczgU7YPef2Yq7C7AheHM8xuPrSStOcRY9fb+rKSFCD3JOm1YJgTnEoFJ/6KLlWhYCtQTSfWAz4dPRq8Y3PdojFPr14vXB0Ziq35UaNEzPgwq0/4p2ZepkKvoAMstqCjn3TK5zb8fHPZYJdGYJ2EMnDuPJ6pGaeuYme9nO2WKEuWK1uE67HcPVQImDDXGYFOgESRAMBqzl5V6JqIHYtEQniIAjh/6wdC6XWLhiJq+4oOMDInQdyF2En7XlfXu9iEDqgn16fHFunY0Wets8eaSXA4Dbq2YOlgJOuvvxyRr0ycbyVOd1c0TEn4H/mLdaVNXl/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFGYIitf3A0fGZ+lQhNFzsdOA5cXOGjxn37aGO0frpM=;
 b=rCtPLV2O1QLEu6WWjgjv8LYU8xWoY6g6j9c+NzXqY5kCVQ98zVS6WQdQpMJIA1FXb8svbSnlLQL6wJWY1Fh+4C3EiniKO2Bw59FFudP8IGu+CR51YiQMQIepAIdSMdt/fZ0pRLtOUD74Xoqk9HKCDMlZVkZwczawtdw7a7Dym/aEMyhAHmzL2Ti87kyZ9UJJVpmeSl71/DgUcNM4Kxz+7p1tnFQsTgaRdUjO0kSkeMw/V/xRHGZN/RHt0Nehu+c6NcdjY6yqfUYA9DWuX7iaXlxo7zmZr1yKHVs042oZeoW8GyErF6FhXPRz2Nrv2gr45lnKh3QAYsdVAM7dBujZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFGYIitf3A0fGZ+lQhNFzsdOA5cXOGjxn37aGO0frpM=;
 b=PVbTkkTyG6db2TjUoiOab3GqJdNvGB2ys9DKaWWdbRAJYiQVE3GBapoi8mK9K0UqBXFyq6NYYXk/BuVQD4viODzzKGORh23EJP0MH7ff0DdwV8qUDvPczuIzrW8aTQ/jLvGkqXTncuQiRGVNvPXfN2UO1PbX0OUsHoXmPkHzEQU6pSLPCInQ5JeKJgwvf9wKIS1I7VA/a9Phlcb+G6BvlSUQo0k5QJL71Lc7cA4DzIdWh+5/TQDZFJy7unR3JbegPd/8GLrPI1u22XIFX8t9B0nBKTnkMRK5urTkhmNGQpQyVv7FR457wyKTHpX9DbhuLt1I96WzrgJ+rdcf56nPAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PR12MB9647.namprd12.prod.outlook.com (2603:10b6:610:2b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:40:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:40:35 +0000
Message-ID: <c7bcefb8-23a4-4f10-8115-60c3dfe69c00@nvidia.com>
Date: Tue, 18 Nov 2025 22:40:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2> <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
 <9d46760e-f315-4757-8502-ca8d48c6405a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <9d46760e-f315-4757-8502-ca8d48c6405a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PR12MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6bf658-6992-4cf9-6756-08de27368b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2wxUEdFZWx5TVFLRmxKbXBsamdMOTIzZjlTdEk1eldxMERvVkc5ZjlTblJm?=
 =?utf-8?B?MWxrcUtURDJBUFRhUjFqTCsrL21LdlVHMWd5T21IYkJTM1FBVU1PN0NNQWMz?=
 =?utf-8?B?Q0JQZWZ1UVdyTmdFT3NObUVqSVo1emV3RGlJZWRYOHhvZXBqNWRVYkN3bjl1?=
 =?utf-8?B?UHl1RExNTUF6TkdXWHR4d2lqQUpGZG1tVkM1ckt6NkplcHhlQWpuK3dqWFp6?=
 =?utf-8?B?NmRWUUR3ZUtYQ1BhUHY2R2Z3NzRxdXJZVU8yTHFqV1c1RFdVblcrVnJyTG1K?=
 =?utf-8?B?YXF4OHBhVVp1VDhBYVBob3l5ZXlETkdmWmlOOUZsZ3R6cm8zVVVlbkhOcGgz?=
 =?utf-8?B?TEs4MHFyUjhScXh4aXhMN1M5TlUrNDc5TS9tRysyblJBaGFaNmVwUTQrSEln?=
 =?utf-8?B?U3Q0Q1YvSFlUSEhpdXM1RTNvb1J3d0hOenJnOTFhcVBxempxNlhMelVic1hv?=
 =?utf-8?B?ekxJOXVJVENQb0FQOENKam9GUGNNaUNKd0ZqYjNmZ3gvSzhtT1Z6aUxWL1Fx?=
 =?utf-8?B?blZOVFMyM0FGbjBjM2JNa3k2dHlSTmxVN0xyempVTzZ1Mk80SjN3UGp4c2JH?=
 =?utf-8?B?cFR3RUNiMnRrR3k1Y0N3bUVPSytFZjVqbU1YbXFDb1UvcU1XdDlXRjU2ZHcz?=
 =?utf-8?B?VjhBSlQ0UEluVmhjWXduaVhnbzhDQmhTZmhVVGxyZGpPVi9nS0VPZmlpSGQ0?=
 =?utf-8?B?MFNQT1Fhd3hlU2prVmliUnVINHVMU0lpazh0VGI5R25zMkg0Ni91a3ozTk1Z?=
 =?utf-8?B?SDkycWdlbHpKL29qbFhvRzI4MTd0R2svQ2J0Y3JOMTBIZUVGNU1GajBvcE5o?=
 =?utf-8?B?dU9SSzc2T3hIbUZTNDJMUWdPZ3hFaVZMamw5bzUxbjlPaEFJL3RpOTZROHlz?=
 =?utf-8?B?ek14Yjl4WC9DcFNtTHBQWVRiMHFUL01tc3RhekFnUVFTWEZQZDBRc3BHVkp4?=
 =?utf-8?B?cUJjU28rdytFdHVsSVYxVjgzWjBWc0wvNVRXRUZGazg1WUF0MHdaQWx4RTZU?=
 =?utf-8?B?R2tJcmZ5cEpQZkpsK3Q5NkdsSjFIL214RU5LbkpPaFlsaUc4N2l6YldwdnFo?=
 =?utf-8?B?aUhqaDlvRkhCcFhnbUUyWkxtVDcwY2E5T2pWNFZZYTJHb0dEdGZKYklkK3Rz?=
 =?utf-8?B?VitxSUNMaEZXSlJ1aEdhSzg0YnpIZEpPYmxPa25YUER2NWE0THVWaXV5NVNF?=
 =?utf-8?B?UEpUbzBKYW95SGVyYVlJMnBIKzZ4R2lOQTVYRENsQTRhb1BXeEdQNW8yZzVt?=
 =?utf-8?B?SjY1WTNJTkpla1dEQkhnYnZxekN0dUFJMkloREFrRnpIVzV1VE83TURJeU1S?=
 =?utf-8?B?Mkk5UGJkeGREY0hUaWRoZkZqVEdUckVvWG5lVDVUeWFaM1dTNjBLcmhNam50?=
 =?utf-8?B?RXVJK1llbzA5NExPK0tXZUZLU0RDSEFsRkxxaytaOUR6SUVCM1Y1OFcyeFFG?=
 =?utf-8?B?ZU1DeC8xM2NCcWdDMlE1WDg5Z2RsRSt0aXdJdXVFcW9SR0IzTjhBQ1pPelBP?=
 =?utf-8?B?d1A1bW8wb3JQR0s3ZEM4NzNNRkVpNXFTZ3hpblBtKzR3VDdoamtPM3I0UWhY?=
 =?utf-8?B?dDVBdjJ5c3BuRko0RUVpNUpMb3B2ZzBOUXRxdGhEK3hmalgwalovaS8vYlRj?=
 =?utf-8?B?VHpVU3BUSGR1dFliY25FNmJ3Z2RKQi9aV3VOUHQ0YWF4NGcyanB3Y3ZxYlRo?=
 =?utf-8?B?WktIZEdlbWVaN2JhUWI5NEZ4aTFyRHJmbW1rZXl4MHNVeUJUY1R3Vm1RRFRR?=
 =?utf-8?B?TGp0aTJpRmdHbVB0K21TTnlTdEpyQ1hiOGZ4VnRST1FMR2taWDZzT3VWZUM4?=
 =?utf-8?B?OFh4SUhZdUhoMDdxWVN2cXVUNnkxMkRad0VneTNPQ0MxZzFXTUNQbXB5UHJZ?=
 =?utf-8?B?TGZKbzlBZU9Fcjg1Y2t0cXlHSDhzeDgvSUEzN05TL0EycFZXajJEYTk2V21U?=
 =?utf-8?Q?LJNMKTEhko9J1FoWADw7r1vQyVtQJTqg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTBNYy93RGV4ZTBKdUg0c1phSnFEUzdHSXFMUlliQ0pTZ1FESGZXOVo0TkN3?=
 =?utf-8?B?RWUweXF1OCtaQkVMS1FuMWpTTHNYc2hldmQ1RzgwRzhTM0lNQXVlZE9iVTRh?=
 =?utf-8?B?MzU5L3BmSnZDSVYwUjlGREt1aDVFMmcrVU40WVkxeTJxWldranlLVDZqaUdP?=
 =?utf-8?B?aFJ4R0U0S2JzbVhZaS82dXZNQWFYdnVyYkpid1NMVWMzUDZ0VnBsZktpVzRP?=
 =?utf-8?B?SVd2TEpnMnQ4L3J0ZFlMOFh2U0M2aGNad0l3UExlQ1hzQUtGQ1J6QXFiN053?=
 =?utf-8?B?LzNnN2t0TDk3VFNkRHY0amFTOHhnWW96SFFId2d5RllmSGFicHlHRHRJakhN?=
 =?utf-8?B?dEZZMjdReDJpYTZvZERBejA2MHJ6aDY1bWV0M01oWDNRRG9USVZyYU53RzlU?=
 =?utf-8?B?NUllQXdYdFdMd0twMExSMWhkMFQ1K2RaWms1ajlVWFFkOFJjRmxwMUhVMDlZ?=
 =?utf-8?B?TE82SXFNbUw0WTg5SFdiMUpVU0Y3c1dZSkhHbTM5bjMyTTJDYjdUQ25Fa2cz?=
 =?utf-8?B?ZE5sTy85R2ZMck5GWHdoay95SndzbTYxY1Vaem9nVjl4alZicGw0ZE1aRkUr?=
 =?utf-8?B?ZnNmS0g0UnB4M0Fjck5PS05jdGVDRmNqZmR1ckNjRlNyZDBhR3lGL3Nwa1ZF?=
 =?utf-8?B?NC9MMUR2Mi9KSjRsRERtdmttaVY2d0VNK2lpTFNtNVc1bEMzT1diVk1pRTZW?=
 =?utf-8?B?Sjk2b2loZndyeDI3bDQvK1A4YUpoWEt0T3oxaHJxM0xLNndKMGRqWFJtTDBF?=
 =?utf-8?B?dzJWdHJOd04rTXY0N29iUTVaNHJwVDhMR0NHMlQ2czFyK04xRXBvQ1FuWGpE?=
 =?utf-8?B?Nmphd2djWkVEcC9yMzJWS0ZpTnJtNVUrSTFFWEJ1TmRQWnBMY25FckZyUlc5?=
 =?utf-8?B?WnRzSVJJN3JzVGg3UjF3K1NRUDNXT2tpZVdZZ2RFU3JaWWZkOW9OYjNMQmtY?=
 =?utf-8?B?ZEhsejdsK1h6R1NnZ2RTZTVubUtZNHlHdVg3RmRpQUNLdzhIYjR5UTYrRGRt?=
 =?utf-8?B?ejk1djhJcWFtMEQxL2tWZW1rZExUWWtZMFd1aXlZMkNrc2p4UEp0dU9LQVhM?=
 =?utf-8?B?b2ZZMGdJM29XQU5abXEyRG0weGdnMGhTNjdyYnlKU2grcDB3SUExOE02Mk5K?=
 =?utf-8?B?dTd3bjJSUmJrVUxkcExONFF1ZURTamRXZGROVytJTHlMZ1dyck9RRVovcTZP?=
 =?utf-8?B?R2lxVklBQ29XOVJvK3Z0MFpKWTk3SHYrdkp4SjRReTFFT2MrYkhjWFdMeHl3?=
 =?utf-8?B?clpWT0VlTXRjaGtwSnZIVmxGZzlDcGpIV1RXUElQUXlORWsrUWFFL2p5Yk9J?=
 =?utf-8?B?dWZaZUtYZDNHbTd0dS8wRy9nU3F5MzZIU3lHVUthekxFQkI4dVBYMHUzUmZV?=
 =?utf-8?B?NXhEWWdZcGNlOWJHdm9jZVdHZ1dvbGl3RG8vUHRoZ1ZSU3FxNlFuelpSRXAz?=
 =?utf-8?B?RmdNa2FCZTlkd1hLWG9pUHpCVHZxZGp0YWZBaEd1UDdqNXFpUlY4aXVrK0g2?=
 =?utf-8?B?aFRSQWRGRkhFTjdlbm14UlhsdXNZWkl0V2NaUExKOUd3QXlrcFRjeHJTaVFi?=
 =?utf-8?B?cFJPYnpPZCtqSUczQTZLZEw4SGpiQ252UHVSNytsby9MTEV3SW8rY2N2ZHRN?=
 =?utf-8?B?eDZsL25Jem1NV3lGcWN3QVo2OWp6ZktjYUZ2T1l2NjBWVTRzR2ZHNnJ2YjZD?=
 =?utf-8?B?S0ROd2FVbHN3NGd5RFNQaWRlU0FrN2VaNlAyVVI3SlF0QWd4M0tzT1dwTEU0?=
 =?utf-8?B?WWlnWi8vclI1TVpQb1lkaEJKM3dsUUtNck9NaEw4a2dvcUUrQnA5UFhBYkNK?=
 =?utf-8?B?RVFLSlA1THFBbE04aWF2REplQ041UW53R1NjTW8rMXBLclJvUEQ3OWZPMmRE?=
 =?utf-8?B?eWsxVTAwQVErVkNML2NCS00zTnZ6VzlITDRYYndLbDZrZStiN2hGUG5KNGkr?=
 =?utf-8?B?L3ZTT1ZTNHNTTENselROSHdKMlQ0eUY4cXR1UFA5ejFEUVErbXQ0MWEwQzNn?=
 =?utf-8?B?RVFYbzd5M1QwWkhNb2hkQkJoaEtIR0NMUTh6aGlpeE1jQjE0S3NIbkNocnBa?=
 =?utf-8?B?TE5OV3ZyanVXVGJjNWpqdHBHbHlmK2dDZG1Scys0N3lyU1JBaXZFNFRuaUV4?=
 =?utf-8?B?QXJ1Zk1XRVEzRk9DbUs2YjJ3QTh0amRodHhQdlBGSVFLYkkrYzZ4aTRBa0wy?=
 =?utf-8?Q?ThTb3cesgJbBPYlEQ0qXGqQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6bf658-6992-4cf9-6756-08de27368b0b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:40:34.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBW1vHhvtpkveJj3F3RcYKaWblpjrDyLLZNiTmrMwVXmYxwSfGbwbrozn+o0KJkGw//KuC7Sq1PyT8jY7igS+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9647
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

On 11/18/25 11:45 AM, Joel Fernandes wrote:
> On 11/18/2025 8:04 AM, Alexandre Courbot wrote:
>> On Tue Nov 18, 2025 at 8:10 AM JST, Joel Fernandes wrote:
>>> On Fri, Nov 14, 2025 at 05:30:42PM -0600, Timur Tabi wrote:
...
>> On principle, I tend to agree. In practice, we will probably never have
>> more than these two variants, so we need to balance the benefit of a
>> trait against the overhead of defining it in the first place (there are
>> quite a few methods in there).
> 
> I don't know if we'll never have more than one more variant really, its hard to
> take a call on that. If a third variant comes into being, then the match arms
> increase more.

I can help here: remember that the firmware team is moving rapidly toward
simplifying the bootloading--a lot--from the kernel driver point of view.
Not-so-distant future GSP+bootloader firmware will require little more than
request_firmware() to load files into kernel memory, and then write to a
register to say "make it so", and then just wait for GSP to report that
it is ready.

So we will be out of this business, and there is no need to invest in
allowing for more variants.

>> Trait objects come with their own complications, i.e. you need to store
>> them on the heap if you need more than a short-lived reference - but in
>> our case the short-lived reference should be what we need anyway.
> 
> Yeah, true. AFAICS though, and as you mentioned, in Timur's case it looks like
> that is not an issue and we do not need an allocation.
> 

So, with the rough, and probably accurate assumption that this is all
the version we need to support, I'd suggest comparing line counts between
the competing ways of coding it up. Maybe that could help as a tiebreaker,
if not everyone agrees on which is more readable (I'm trying to avoid
weighing in on that point--you're welcome, haha).

thanks,
-- 
John Hubbard

