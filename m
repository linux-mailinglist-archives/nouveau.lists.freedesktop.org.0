Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B48C9D73E
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 01:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CDA10E6F9;
	Wed,  3 Dec 2025 00:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oKjypKU9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013044.outbound.protection.outlook.com
 [40.93.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CB710E6F9
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 00:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDPcSuot0yEqH8d5gnLBw1n7JfR4A0HjKTOWZ+5b9ItuVDZWW4ccYoePTq4AvLNCU7r/Ml+Wo2D/XHukdjZVEULMpdERMUOiKkwUOKm8gtevNSUUAmKwd5Kd2cfStcJ/GvC3gkFBC2YR3RHisxGz/0UzLJ9jt0a+dtB0/GUuKIuqsmZIwfmFf6HzX2We43u8Zgpr9mFmXRxVPk3yF6Sr5V5TxqD4QoTINJ3ib0PQbkUAfnKavbqM6Abuz8qBzq4q7Rb8Hvur4hx9biL5Zvtr1PEifyd9+DGYnxMigHk2tSpP7v/FOCnLsy7qR827JSkSd61OG1WD3iFDAttE7CINpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOOkguz3Xj7eVCqg3v0j/qG53KDBTEtpmqXkJ4BIe9M=;
 b=ft60CcQYgMQFuHtG8/hshpKM3ZcS18K6LH7QjIP595qgv2H9/d6XQ8dtO1ihNUN8Q5h214X8g8IUgfKXLyLsFAUZ9VM200fr1ZGH7V8UVjbcbzGCccPXx0IjKT5Eq2qkUzDS5M5/2NUH+FYaPhkYxfEp4OMWB+zWpg19/USGuGRbLW/esIO+cFgszu8rdMPAqLHuzJPIKojqFU7fkqGBlh4T6QnUUEsmUX3rdpWJ7Tx8VRLDp7JAG7PcVNPEdVvVQEUYNKcFgiSiYdlKwGWWLbH/El8Y8qOnM+0iobN2yWxdWZE7EjUwVEOjSv0ximcHY9b5/P2KRiFdybqfckLrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOOkguz3Xj7eVCqg3v0j/qG53KDBTEtpmqXkJ4BIe9M=;
 b=oKjypKU97AhaIT0h5JrJSXIJp9aYLjitM9+fWxm9Q0m2L6XQR3kIVbeOGP7Spc23pLLjuUW6eZA9vRZh/Q1ok+1YNr+aRviKkE6i0KB46lMiexb57YDInpIiH0ANmCZ3yMlplMIt22RRh/SP9Q+UId1HF91h2RuYBItwd5Ovc2OOE1GoZlhQBuQqKQogTJLOq9NIdcRNWn1hzHKBMGpiaFWCqMI6+FtrpxoT7gKwoZOHgDhOuoOjvvkGS9MdZD34Ewh4meFUt4ScclRSs3DJnGE334qwJI7OUd3KEDPVZxUYnAk/yYDyjgyGhyYnlcefy6KGivWJ3kusUEPFIzVYgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Wed, 3 Dec 2025 00:46:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 00:46:33 +0000
Message-ID: <2a4a6fd3-05e6-4291-a0e8-65db73ae78e9@nvidia.com>
Date: Tue, 2 Dec 2025 16:45:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
 <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
 <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
 <d94e68d7-84a7-4540-8de8-5f163d22d763@nvidia.com>
 <5f107927d9ee9dcc1ef02fd09f5e2e5ece3f13fa.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5f107927d9ee9dcc1ef02fd09f5e2e5ece3f13fa.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 72476f30-eb39-490f-34ba-08de320567b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzBZL1lQNFRSdnpTVVd6UUdYQWNXY2FJQ21yUjJKQ2VjWHIzVGVwVitkOUo3?=
 =?utf-8?B?ZmR0dE1GSmcyUmpOQkc1dEt2NkdtOStSV0pOYk5wcjhnOFgxYjZ0SkUzRGlE?=
 =?utf-8?B?TnQxSG4vNUJybndldk14UEdUOTMvT2RIQVEyNTJOc1dwZUpnWmwzUjhtb05a?=
 =?utf-8?B?dVBodTVRc2QrR2Z4QjBpL05ZV2Nrc0Y1enRIODBXRk1vbnBGcmhDNEtLQzNX?=
 =?utf-8?B?NzZ4VmxZTjZ1UDBHV3B3VWREUVNMc1habDF1aFZjSFBhc2xGaGtoZ2RSa1R3?=
 =?utf-8?B?WWtadFBpaUQ5Tk51VUQxbVlGdVJkVkpmOGFLaDluTm53cmhueVI2ejYxR1U1?=
 =?utf-8?B?Y2ZMajdGQURSUXNJcEVVcVRORFJNUWd1M3BiZVF0QU85WVZvTWtEVXQ4MlVR?=
 =?utf-8?B?SHpvU1BKQmxBZEZ5c29lQ2RZWGtxSFU0cys5ZDZnczBaU2ltS29XWjBRdGcx?=
 =?utf-8?B?OWZRY1pEaGFhZG9OMXl5MVd1d2VncmxobkJkRzA5bm1MYnBuMG42TnV6U2RC?=
 =?utf-8?B?WlN1a2Ewcm5KVTJrZzA1WGFTWGpod3lOdTM4bUN1VWVyRFhyVkRKbTJrejl2?=
 =?utf-8?B?d3pLOVpXa2s0Q0dyemNra1ltWE5mNTF1TS9MRVpYeURVSERvUzhRVkExbXZ3?=
 =?utf-8?B?ZkV6Zm1na05VM3lKVlVmQmdaVlhkZXpVcnRtS1BkeENtQmF3RitXWjZjL1cw?=
 =?utf-8?B?eTRBRDJyKzlsZStDYUtpSk12YmZjS3p3TCtrWjJJWlE4RTN2MnRUVjE4WWdB?=
 =?utf-8?B?cXRNM240b1FZVXhnbHFyd3YyeHRlc2VqejR0MHNzb2UvMGg0L2tiQ3I4eXhJ?=
 =?utf-8?B?d1RxdlBIUURJdXFvNTJqck1HbmZRVkM0YUZvZjAvVWRPYXhIWXRCZzAva1dY?=
 =?utf-8?B?bkxKVml2c3ozaC92aXh6ekZ2bWlsOWJXRGx6M0JBN1ZYTUUrWGt0TUpKRStH?=
 =?utf-8?B?RlRZQVFKV0lWd2NBU2ZWNTM2d1VhSWI0eVNKcHRJcmltV3BYaElLL1dmMndi?=
 =?utf-8?B?cmxVdlU4bjN1bW1ZT09ZeGpUVkNYTU5Qdi9YNHpTdmVFVkpSVmRDNE9sME1K?=
 =?utf-8?B?VklWdlg4MlhBbWw0WmZDQXNsYUJVV2VlbDFGcml3Q21SWEozdFZLcHdjeDM3?=
 =?utf-8?B?ZjFBbkgxeGZMVlFLZXdTeEpBWWpRTk9MVEZkS1BBMnNNbDdwc2ZYZ2Zoazhm?=
 =?utf-8?B?UWd5OWlsS1IvRkZYY1FTdU9lNSt0bjlXYnBwTEhCVmlIaGtQb0lUQXRGTHly?=
 =?utf-8?B?dDN4OXNWdkw5SWNES3RRQU1abkljVzRNcGh0d2NoVVBGZXB5cys3bXpLV3pU?=
 =?utf-8?B?MTRIc1h5Z0xWWXZpUWlZZWV4NnVUKy9GNEgwZk10N2s3bmY4M2NSaitndUw3?=
 =?utf-8?B?dExkYU9MUStKcFczcitNNzlJWVFWQU9wT3N1UitPejJPaDZzZDlWK3I2TVlu?=
 =?utf-8?B?QzFraHFiRjhVNHZNS3RKS1N5SnRIbHphbk5ZdmFseTN3ciswczI2SGg1enh0?=
 =?utf-8?B?aVNmYUhoZjFNenZCbVlhcWkvaE9BMUNYQzFkS3Z6L085UUxqNWN4OEppMUtm?=
 =?utf-8?B?K0d4ZWYvVlNaU2E0cDVaSW84Uy95MzJwSEoxR3ZCNnd0eVJkSkkyVytjTC84?=
 =?utf-8?B?WjJRb21WZXlpYnBJaUxja2ZtNHRlWW43aTFrVk4wY1hKZUhGOEZwZnIwTlZ4?=
 =?utf-8?B?VWFxaUNPTDFHM09LY25zMklvbE9xdllwdmpBVVQ5d2dIK1FlVXd6VE01SUdM?=
 =?utf-8?B?Y2p2eW55UitUV0tpR2EvQnc4S1RBelJBaVJRQmZuOVVvb2VsOGplUVQyMWlo?=
 =?utf-8?B?alFLdTZqbStnVGVrekNtZHBqd0ZGUURlT2kwdTBmWTFGVUVWWGYxUEZmdnJZ?=
 =?utf-8?B?blVjN2JjbnFuK1RDVmpGREw3L0RqMHY3dnpWcEw4Qi8wU1kwYk91TlFjay94?=
 =?utf-8?Q?bvi+0X3wLTk3t+y3niQDZc08dkRpHoYX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnNUQ3BtSTJzSE9RWHc2K2RZMVpsWjBkcFVkSUtBdXRyN25reitaUWRqOUFK?=
 =?utf-8?B?c3QwOVhJQ3YyVEdMbFRPUVV3TjlaMDZSdU5raFRZUC9xVWJYUkVTOVFqR0Fk?=
 =?utf-8?B?M3lxMFVrNFFzak0zV1ZLMVpUVDlGVTFnQjNTcTU2VmZBWlFCSkJZYUZOK0Js?=
 =?utf-8?B?N0VmOC9kYkJva0NMNjR3NnVEN3ZHOUZlWS9laVJuU3hXRVhmTThxTHQ0aDQz?=
 =?utf-8?B?MGlINFhnRnhsYzc5MHk1K2ZPMGxOTVVZNi8ySWlNMTFiMkJwdjJoUEQ0SzFx?=
 =?utf-8?B?RWh2VFMwZEpvbUN3Tkk2MmljY3VOVlJiTEVReEVEV1Rzd1lUZytPa2FHZUkz?=
 =?utf-8?B?alJST3JJcGNmb0NGUlp5M0o5Yk94MmtpY2JmenlpUWhSZG0vMkdaYU5oU1Ny?=
 =?utf-8?B?WFZra3VuU2w3UkhNZ1h5L0FRelpBdkFZVWwzZUxFUzdrZnpmNEdwUjA5K0hj?=
 =?utf-8?B?Mjhnb01SZUw5QWhMWW9BcDlLRWVhL0tqT3Z1aCt3dkl4R3R6REQ5L041N0Fz?=
 =?utf-8?B?WFQweEZKdXVsNjhoSHdrV1Vlc20rWGUvbTdaODlNSlBydUhmRE4wU2hWZDRB?=
 =?utf-8?B?MWVVYjVDUTFvU2l6TzNJajZFQzl0RUVnclczdjRzMnpFaGlTdHJWcnRWaCtC?=
 =?utf-8?B?ZlhPNDBnRkxlMG9wdWFvSDVwcFYxbklGZ2ZDWUNTZW5Lck5ERUFQOURFQ2Rv?=
 =?utf-8?B?UXpReFBUamtjZGdWbGtMUHlUNDM4NFp5OHRZc0pJdllENEJlL212TENiUGJq?=
 =?utf-8?B?MDErWFMrSUdaenFiYzVxamNNRUV4aU9Hczc2T1RIOVhWRnlveXkxKzV3b2M1?=
 =?utf-8?B?YmdvczhzcXNZK3hkblFRR0Rxb0NPd1UwNFNkN3ZxZ1pGUFVpRUwwNzRvdklB?=
 =?utf-8?B?SlRaTW1rSFF2Ym1JRDZJTWxEUW9wMDBMNENVZDVLbkVhdmRuYkNpcXQzQ1Nu?=
 =?utf-8?B?VW5VWnBkaGFxcWJxNWxCSGFObWtJNFpmN1NJaGlsRFZxMkk2RDlUb3BtQzBD?=
 =?utf-8?B?dXl2NTRoYWJyNFBLSnNBbHlEa21uM0plUDBxU2hHWXo1ZW5sOXI3ZVBTNGVm?=
 =?utf-8?B?MEJMZ3huZGlKN0pza0wxYWlraFkrc0lmU3NpcDN2ajA0U2pMOWlNVkN3UG04?=
 =?utf-8?B?Y09SS1lYVzA1b25hRm94cGdEdTlHMmlyUmNVeFZ4ZFV5MU5CMkxrZXJObHR1?=
 =?utf-8?B?bjJFSFg3elh6eWhkVWZBZ1VEZFNwb3k3SExWZldmWnNXUUhDZmFxNk5OV1Np?=
 =?utf-8?B?Z2xkUVVtWW1ZQy9QamZ2QjN3Q2JsWnNkcEZ6eDFETUZ1SitYNHRwdmhBMDdi?=
 =?utf-8?B?RWNKcFI1NXYrOS92eUxPUTRPcXhMOXQ0VW5QSGJMUHRjUU1LZGoyQ1ZSODBM?=
 =?utf-8?B?UmpHcDFqNDFEaENkWTJacVBlUzV0OWhWWFNaSFFMY25HM0VOd1RQajZ0WGJv?=
 =?utf-8?B?bXRCVGhhU3Jzc3RBQTB1K1N2RnlSeEVNYk9MR0NBdmtncUlMaTVvNlF5Vm1r?=
 =?utf-8?B?dCsySVlEVFRaL1VoWnN5bWxrU3RleGFwRENaaVpiL3hmV1cvc0pxSTBiN0xY?=
 =?utf-8?B?Q0tqZVdwYm5OdjlkNGZ0NkxBY1RlUERhYnVjL2FRQ3dyeVpyWVNZNDlWWEll?=
 =?utf-8?B?dGQ0NlBLMk5oQXcyeXMwd1JZZ0tVcEs3WDZMNXZpNGlsbnVkWDF0dU1ESDdC?=
 =?utf-8?B?czdZbERtOVUrTmpiNElTa25DYUVMaDZvTm5oWEl6MlZTT0ZYTTArYVRJcjBY?=
 =?utf-8?B?RGN1dTZvVU5tVmNLdE5OTGNDRmVvTElHSTVURmtnZGVuUUZyVXVBUXkyeTZj?=
 =?utf-8?B?bUlhbGphYlZqd2VXVVg0cWFQSEZYTnNjUkc1MGdjSFNMM2RiSk5NYkNvTU8r?=
 =?utf-8?B?dkhRVnViVWZXUTNLaFJ6WnhmU005MjZEaEhIU3FDWi9lWTNPdkpOVmNWTkxE?=
 =?utf-8?B?Slk5clZGejhuK1RRSlU5NEdFQXAreXluUkptZDhmV0Iwc0Z0VkZucCtDRnU5?=
 =?utf-8?B?UUVTVmk4cGJ4eU5PVXNLZWtlSVlZMEY1ckU5VWxaTWdmSW5WVW91c3Y3Tjhm?=
 =?utf-8?B?RVZQamt1TklGN0g1UjFUK21odUM1RDVEQ0w1L1RUTXJSeHZJZVM4UDN1OGQ5?=
 =?utf-8?Q?7P+evJXfQyPXNr2pYrFk3Dh/V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72476f30-eb39-490f-34ba-08de320567b3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 00:46:33.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nb3OJ/IOFvxnpuhJJrPxqs0kYM4hiHCqCqdyFMMDhba+5z/0Qyk5JzCAOsjEjrwn/tVNEECCV8inh7P8bMkNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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

On 12/2/25 4:42 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 16:35 -0800, John Hubbard wrote:
>>         for chunk in data.chunks_exact(4) {
>>             // PANIC: `chunks_exact(4)` guarantees each chunk is exactly 4 bytes.
>>             let word = u32::from_le_bytes(chunk.try_into().unwrap());
>>             regs::NV_PFALCON_FALCON_EMEM_DATA::default()
>>                 .set_data(word)
>>                 .write(bar, &Fsp::ID);
>>         }
>>
>> ...but actually, I think your way is better, because you don't have
>> just justify an .unwrap().
>>
>> What do you think?
> 
> I agree.  Avoiding unwrap(), even with a comment, is always a good idea.
> 
>> I figured you'd enjoy this, coming as it does just one email after I
>> wrote "never .unwrap()". haha :)
> 
> I think your code is effectively identical to mine, except that I don't need the PANIC comment.  I

Yes. I'm changing my code over to the non-unwrap approach now. That
really is clearly better.


> suspect that in both cases, the compiler cannot tell that each chunk is always 4 bytes and
> try_into() will never panic.  In my case, word[3] always exists and will never panic either.  So I'm
> guess that the compiler will still emit code to check for panic.  I don't know.
> 

Good question. Maybe someone with Rust experience can enlighten us on
that one.

thanks,
-- 
John Hubbard

