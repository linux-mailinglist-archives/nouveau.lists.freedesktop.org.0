Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D1C6D0C2
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5B210E58D;
	Wed, 19 Nov 2025 07:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WmsTBwZI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF9610E58B;
 Wed, 19 Nov 2025 07:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zdg+7rmeJiSBLjSpf5odQ+RVjlzEJXqhRtP27n3mBcFgRJhBpJ6wCpHkHOEiOQMWeMzFv0tgieEclm5fdXEhuxS92Fp3lSs9flLmitfoHecAYMiMwXC0XClBtgAyd6EaQ7T/eQr0Vyv5VlGDVzXz0XDlnzmdB3hMbk9EK85XNrhF8DgGL9vxBiecnZVbIx/gcZNeipVDrmf9Rvun37Lz8ObuS9nYZJ50PQWxnoqPrtLyxifFfiB894fqg4aXSZC65cWAqBJd0MEZwlntejSGGRO3OCdU2mK1kTDr0XTQx7b4tB+YvbnFmN7IspGXGyhBghtaPs0EHOFJsV47p3vhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQjHjhDyx7CjHREtkWEVX2UyfnzPLQ2wpAh32cdefWA=;
 b=JbmeIw8vlJEAf64PC0w85j9VzI/I+OIv5GhO9cQcuPSdV2sW2HUIqrl/+uJ+OCguvRa9HdVZeQeqyptITbINqsg9v21kYesagCSNAmHYuRHNQ23yOv5ima0HnNp9qRHGjPmEL4iFlU7UHelpgTjZ8BWDArK9N7xxC97hEHcaT3X2CGE391EYvtxLhBBPoQXUf3Sj7Aa01mgd/hYc9TNo8RrZAkCUXS/U3UWaaTBNDrwoasxkwCzUPT6xZP3XI7gRD4ZGQ0IlDvIaUuV0jmt8m4NUFhqV5okkt8vz3yyygg+3Pz9L9ZVhbDEdODhyfNqjaUMAOeawnKm9JZl1urKHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQjHjhDyx7CjHREtkWEVX2UyfnzPLQ2wpAh32cdefWA=;
 b=WmsTBwZIT/KIY8wZg0Hh1YHN00wS8gEmYUMejQ2z5BbLzxmZ3P5UdaR1VUlPid9k65eZ10exJ4GmbSk4g4gXrhbvuVtYoyciVtb6bIuwBsulqgjZLRW9REXZC0PXQj+mGKVTcR43gKVAPuPqMCEw8tRmiQMUdfvxowORIqkoKLNh9IldiWgHUY6+uZkc6/KgatvmK2kzyUVgPEhQVeWMnhXkZhYEaFxr4Zfz7AQyZmTdxT9Bas3HqKzghnpMJ5m6MgB1wZapQHGt/x8fCXqU6xs2O51bN76oL1iUPvUL1z6l2l/I8qlnbUcmBZW9T4eowqzYlT4ILtgIBbbhlLfc4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFAB8DFE4E8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8db) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 07:15:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:15:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:15:03 +0900
Message-Id: <DECHIL6CZUVR.KJPD43LSJFDE@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
 <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
 <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
 <DECGXPKLO95J.Z6NF92ZEXY27@nvidia.com>
 <1dd37cd3-539a-4698-bc9d-a99610fe96f9@nvidia.com>
In-Reply-To: <1dd37cd3-539a-4698-bc9d-a99610fe96f9@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:604:99::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFAB8DFE4E8:EE_
X-MS-Office365-Filtering-Correlation-Id: e37e5c40-f7e9-4f8d-20c6-08de273b5de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVZnOERza2d1TmNYcElweE9uVFRJSDcyQytQckxnUFJsUWx0aCtTK0FobkQ2?=
 =?utf-8?B?dGNEOXVYaGptekVXQTJIQlVvTktuZ2V0WmltQzJHT3ZhdmUxMzYxaGlLSUh2?=
 =?utf-8?B?eGw0UWg0MDBwSXlCRzhMWHIySjcyajZYZXpjakowd0tMei9ERTRpV1pHaUt3?=
 =?utf-8?B?RzMxeGpreEFwcGZreWcyY1pydGJpdk1CTkJJVDBsUEM1T1RWdlgvaEw1bzEz?=
 =?utf-8?B?WVJBYnVlejlyUHQreEpPZVY2VW1oVWM2TkJENVpqQ1VqS2lkYXl6MFoxbUNv?=
 =?utf-8?B?cDhia0tOOHBpR2lYV0VoOWhDeldUL0hhbkYvRUJrVFJSTmZtOUkvY0s2V2l3?=
 =?utf-8?B?T3ZqTTBlcjlVZVF0UDYvdXpkdWRjVnJFMjBOUUhKMTkvMXYwdE5OSEZqWGhn?=
 =?utf-8?B?SzE0UENuVE9CMzY3WUxIaUtJY0trZncwaWh4QU9ONS9YMHF4b0lLNlE2ZERP?=
 =?utf-8?B?azJWL01nV0JPd1ZINS92enlTOHJ6NnFESUROQ240SnZMWUsrVVViVmMxUDlL?=
 =?utf-8?B?LytzWVdYdXUydWRnc2xWN0xIOGZkMVNoYlhja0I3TlYvVFoxTTdneXRHY1N2?=
 =?utf-8?B?cFZLTHl1TGJDdEUzb0JSR3VINEZqSkZqYStpdGRwQUd6ejlRY0hyMUNRdStQ?=
 =?utf-8?B?ZFRuRDZaUkRURUd5RndFdGtxTVFkUUNxNkxrd0h5ZEoxc1hzeGp2KzJiRDVa?=
 =?utf-8?B?bzJJaUVjcndsYi9TT0ovaEFNT3Q2YWluUkFjWU9oNGdrYk9lMmsyRUNNL3ZH?=
 =?utf-8?B?eklzSEttMXpOYjRlN2thY25icEc3SnFHcEd2SkE2QlR3YU9FbkhTZnA1eVVF?=
 =?utf-8?B?WTIzMGQ2R3pjSS9EUEVxWGxJMDZWV0xnbWlpblFNcEpibitXOS9rU0hTcUFW?=
 =?utf-8?B?RG1aanI3N0xKZms3NUxDRDdIeW5QTTNqNHJ4QlJ3WW5mbzk0S3NJb1BnWWJx?=
 =?utf-8?B?Sk1rRjA5QitSWTlkNVhuVm9TbStwVzJDbGJXZVJwcHcycUFRdzRjZlltc3Jl?=
 =?utf-8?B?dE1SZDh2WFpYYS96c3I4VHFhYW1jK3RBTUVxcE5LUndqZ1pZOFpxa3RRdzhT?=
 =?utf-8?B?b0xIaDIvMEZseW9NSWZCWW5nL0l0M2FON2FGWWhVVXMvRG5EQTgyY1pnYzlF?=
 =?utf-8?B?dnNLQ29WOG5UZm5adWFyNWI5a1JHTkxnMmRUcFpRZkpIUmlWMDdyQzBZZ0Nw?=
 =?utf-8?B?RHlOK1N6VkxTd2hQNldpamVUWndoK2xHbUw4bG5pNkpNekJrKzZkWWl1U1RC?=
 =?utf-8?B?bDUzUnE4NUk5MThrR2gyV3ZnSnVFQlJ0dnBQZURyNXNlQ1h5U3JneE9kZktH?=
 =?utf-8?B?Y3BWaUNPL2JMMkdFdjR4VkJxQzBBUktlWWNyUWdiNVdoR2ovaGF1Ni9PeGdu?=
 =?utf-8?B?WnRxWllRdG5oRzlnMjJvaS8xbkdvaFo0WXMxQWdtWmRjVlZLUEVQNlNBY25B?=
 =?utf-8?B?V09QUHNQZlBJekloVm41VGxxZU9BUDhheE5KWG5NbGliZXBWdXZLWnN5cmdy?=
 =?utf-8?B?RGI4QjBxVUMwOEtBZmRhY0RzdWxqODZtek5JbW5WVHVhcktFZUg5cFhzcmdV?=
 =?utf-8?B?UFlrSlRnaU9ITk9CZjFyMTk3NnFmKzNpbHhsYkRBQ0oyQlBkcFgzTDZMQk44?=
 =?utf-8?B?RmxTb0hDRFlIMG5ZR2Q2c3J4c3RQSkFxWjc1STY3N1lUZjhEWWx6TDlkcHRN?=
 =?utf-8?B?bUdZcTRiYkFFbFFBVkNTL25jNmlEU25sdGJnM3o5L01pMnpEUnQycEFDN3lh?=
 =?utf-8?B?OC9RNEppVFNCL0ovOVg4OVczT0xkUStiWDhRbWFMZGJFZTJJcjE4Nmx4RFAx?=
 =?utf-8?B?ODc1K1VXdldtVDJ3MWkzZThvZnFzYkpUUmxXSDVVM0FvWGFNb2xWcVNxeExh?=
 =?utf-8?B?aEkvcHBFSGdRbUFVb043RmNadTZuY3ZHQmdyMmIzZy9YajFob2YrclVZRFdL?=
 =?utf-8?Q?rcmOgRZt/+HcR2/xIYAkUwV6jTipoq1X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhCeGVVVnZEY2F3OGZoUGdWUmErT29YNEtKakI3czNzNUJ6QU1lOGtMOTR1?=
 =?utf-8?B?Q0hNRC9VZ2t0elM5aVp5TGNGQ3FKVXZtRlMrNDFFWXFISXF4N3JnNUljelln?=
 =?utf-8?B?Z1NhRS8xY1VPeUx2VVg3eVJxRHZ2SlZmeEo5c2dITVd2M3plSWNoZkZKS09h?=
 =?utf-8?B?aVRUUzhhT3YxVXptWUFxdkp1Umw3ZmV3dmljY3RrNW5Hcmk0MnpmcldLM0M1?=
 =?utf-8?B?K2w2Sk0xVnlZcWRxbWNhZlVLKzhacVV6Q0gwZ1FJL2lUVGxXb2hvL2ErSm4r?=
 =?utf-8?B?QThFeVB3UTFoVHpwRUtDOUtldDkyaVAzMmNEeVl4bXc2UVNuVEluMko0UWJi?=
 =?utf-8?B?S000M2hseHFIQjU3RDVUQklRSWFWQ1Q5ZDFzTzdNSWVlcE1BWDZSNUF1VU5F?=
 =?utf-8?B?T1NFWkVFak1rZHdERWdIckhDNGRKZEVwSEVNaUlJd1JoeHhPT1NGdlNsM0ZE?=
 =?utf-8?B?TFQ2VXQvWFBZQmFXTG1rbDhMZHVpRVJidXhuVXlucmFnVWtDaFllL2IvWlF1?=
 =?utf-8?B?NUR4SnlJNTRZQ0pwY2xKZDBQNEgrZGhsc0pia3UyVmZkcUE1WHFTeHRiYWw0?=
 =?utf-8?B?NzNqSlNKZFIxQkhUdEVtcTJyY21iY0xmOVdoTG5CTEJuY0VEa2hqemwxcjgx?=
 =?utf-8?B?ZGpEWEVWdjFpMGIyYW5PTzFqejg2OVRRWTR2UUhiVUJxT3dJeFRoM0RMZEFT?=
 =?utf-8?B?cGdJSHdwdHN0T2JpMWN5Snhndml4Tloxcis2QkZ1dndFUy9hQy9QU3p2b0dx?=
 =?utf-8?B?NGtQK2FpclRlcVhlYmxpZEcyZEZscFUxM2FIYmUzOXFYY09URkhzMDErMW4r?=
 =?utf-8?B?YjlOc29xVythcjNxUUViL0hJVnNNZG1YcjlFN1ZFL081aTV1ZFhkdVJiSjY0?=
 =?utf-8?B?R1pEZkhGRGs4eU5jSWdoN25EZXcxYXk1SjdHU1ZJZ1RUcDdWYTcvVEREcTdq?=
 =?utf-8?B?YmUyQjZkTGJjQStBK3ZRVVZ1NHh1Zzg1RUxtNjM4ZHJoVVpONXVyeUoxRTlW?=
 =?utf-8?B?TVRaS05UTTFvUVYvYUJ2SGFLR3E2b3hhckt4RzJBL2pNMUZEMDk2VlNURlBl?=
 =?utf-8?B?U3FDOUg3enp2L0FQMkhTNGNUdjYrOHBXeExITUQwbEgyd1NWTzNTTkFpYzIv?=
 =?utf-8?B?aU0zL2NneVRIOURHV05VVXVqbDA1MHF0ODhONHRLdkxJWnNRZ25EQUZsTVBP?=
 =?utf-8?B?UktzREc4c3R2czdvTmd3KzgzWXB3V1Jyb3N6eDRzN01vZlFnQmVFK2lNd1Y3?=
 =?utf-8?B?T0dZSE15cUlIbjZkcyt6R2locXBGVzZ4QnpHM2h2Y0krQ3c0QndiMFRRVmRQ?=
 =?utf-8?B?dEJsMTExZlZwM21YeXFpakdwZ2tVVXd5UEFHUU9kOGcwQmJYUFU4TStOTGcw?=
 =?utf-8?B?SHdNRVVVUElHNDBSeFByL2x3MzMwR09sUDBXTTZRN1dxNnJ5UldoSmdhRVMx?=
 =?utf-8?B?NFptazBjNjY5aVlnL0ZaTUZhWFBKU2lvSkhPUmtPcmxsRkYzWkE4VVZsSnBJ?=
 =?utf-8?B?bTB4USsrVnU0S3ZkNmdjamwrYlN3Vk5Uek9uVDVCSWlxNVdsVUcxbi9hYzlE?=
 =?utf-8?B?N0VadzR1bTh4VUpmMytHTldYVlF0RXJhdEI1UCtLVWdyTzJWOEsvYUVBaTJX?=
 =?utf-8?B?dVR6aGVGa1FJN2FUTURjcUNnMEY0M0ZkV1p0VFJZYXNIZ3plQWNVblpQcm53?=
 =?utf-8?B?MzE3ZEk0OTV5dGNRdk5YTjdOMm9PYmwyYzFFY1pxZlA5Rkwwb2hrWXYxVU80?=
 =?utf-8?B?Q0oxVSt6Tml3eFJ4OGEzaEFrRlpJaUdFY1ZSL0F6UndUSEdZZHhsRkxYZTJS?=
 =?utf-8?B?RUVxOUxsdWI2dmVZd0NGOTFOMjJJTjJib0RldTAwSTVJUFJrVVN1czBYZi9K?=
 =?utf-8?B?d3VBWFNpN29UQ2lCWGVVN1JldU1udVBURGt2VHprb2VBczhoMmlYY0FNMUpq?=
 =?utf-8?B?UTRQZWdaaG84NitTd3BiZmFnbGl4bG1WV2h3Sjk5cTZNUXhTbHA5eTA0eGd4?=
 =?utf-8?B?R3hpNFZHMk52WVJZbklHdnQxV2FUR2hGcllIcmhMQzUwSWpURU9Vek5PNjhX?=
 =?utf-8?B?Nm5MQUo5Z1p6U0ZydFRubDg4L2ZQUnAyK0NUSFhhbk9hWnNDTklsZEFzWXhR?=
 =?utf-8?B?WHJwVnlSeHI1VHlBc215elN4NlhBVEtiM2pML25BMzFHSVpnYmlUR2o3TEZo?=
 =?utf-8?Q?2AQ3/MNrPXwhevXMCtMxHlo4XTezsROcSgacAAP62sO1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37e5c40-f7e9-4f8d-20c6-08de273b5de5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:15:06.6525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3htT1tEXc8hfSW32IgeC8kt2uWy5euXC5V/sx9Eb9ynfCzgIaAR8WEPjvrldO7PxYD8gblW3YHtHL0XadU+jnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFAB8DFE4E8
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

On Wed Nov 19, 2025 at 3:51 PM JST, John Hubbard wrote:
> On 11/18/25 10:47 PM, Alexandre Courbot wrote:
>> On Wed Nov 19, 2025 at 3:34 PM JST, John Hubbard wrote:
>>> On 11/18/25 6:17 PM, Alexandre Courbot wrote:
>>>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>>>>> Define some more GPU registers used to boot GSP-RM on Turing and GA10=
0.
>>>>
>>>> Nit (for the patch title): these are falcon registers, we just happen =
to
>>>> use them for booting the GSP. Also IIUC most of them also exist outsid=
e
>>>> of Turing.
>>>
>>> hmmm, falcon registers are *also* GPU registers, though. You arrive her=
e
>>> via the GPU's PCIe BAR0. So I'm not sure there is anything wrong with
>>> Timur's patch title, right?
>>=20
>> I was referring to the email subject (which I should have quoted for
>> clarity): "gpu: nova-core: add Turing boot registers"
>
> Yes. But what's really wrong with that? You can't boot up Turing without
> booting up its GSP, which is accessed through registers that could
> reasonably be referred to as GPU boot registers.
>
> I don't really think the patch title misleads, does it?

I interpreted the title as "these registers exist on Turing only", but
it is indeed subject to interpretation. In any case it is a
non-important nit, so feel free to ignore if it parses fine.
