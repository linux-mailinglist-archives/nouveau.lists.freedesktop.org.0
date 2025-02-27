Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D411FA48CD4
	for <lists+nouveau@lfdr.de>; Fri, 28 Feb 2025 00:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C1A10EBB6;
	Thu, 27 Feb 2025 23:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQ0SWjqF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32AB10EBB6
 for <nouveau@lists.freedesktop.org>; Thu, 27 Feb 2025 23:33:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb3EFXVHm6upMnUUQFusHfAmyo/Qxi9UUzLKchRoVfIp3pv0vGoCAcCQsFxARI1KgsSadyUSfNKTpjcUVumNZADabBRkRx6dy1RP8N4GrCM+yTBRAER4ui/Dk+aZxEWDp+eFPB2fgPzMFOa31v7bAJBwkLbzgE7q4wxYXaxmsc5G9VSMVjBub/sqO/SS8q4rpRqjRTfvPD0knZeyUTTLgl0qZOw2JIDVmIdh2xnOj8NHyQEkzGHuoYQbhRvIesHLjadbYcKaVb0MYpfzor0VeOD8R5pUSOfYUmwLZpXf7kIfg/7uNwjSwe+8Vmywn0EkL5ctNjRXtADXz0ZVfxh++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCnhG7AtwmdkwtLiuVime5AGXt+EVdn+oigtTaNIrqw=;
 b=CJ3ss0HOla+GBhhYQxzx+Vs4BTTIUS1hgclwsUilj/8UF3gbvBB4cg2iUifoqwd0JCMe/pMaWSqMUzaB8U+40uXAP6lRNPuLwTZPLjgDmOC67zx5rW20301UMJrDglGrLyLttbAVUfQtAGSAYpzUGqKo/GNDCLatUq81R+Uj8p93w2UgP5oR0OpnIjfu5+yaPOzo0ILREtvIA6wImpjJZYRXZkD6Z58zXzjunM1sIW7zMBQS4UXNbnKmQkFvVvD1LtzTxKnGCFRNEycap6T9X6tkECwjEnuD9wUTDO68Zs8B71sXORJjTs2MmQtIH3UgrRwr68wzdW2GIscvMONKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCnhG7AtwmdkwtLiuVime5AGXt+EVdn+oigtTaNIrqw=;
 b=nQ0SWjqFihmOdkF22pLC0T7eYXDq3oU1L7l4olodxCD7lBK+DkaI16MIK7YeIKpbeWanHmN0T0vXzQcfO7A4SjyhMElTo+yK9IJhtLQFMMNHynm/aSVYKM0vRdEOnkPy/QUpoy89jvlDgN16wx3rRfdaIZtgG5RF8qRtQbduF51KA6AmnbI87aTqad9UsvNSiSMQquGEflQXQVIK61ubPi6E80JV+sBLfQXDYNYssgqTGykhQLLijVu1RklO9JSlf/OdrVoeEPr+u4AAec1kRFyFNnED8rN7bSFAagMuDa+ILYJUvq+lzSr+d0enKEqImyMPSXTjKkjvngkqyMYBYw==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 23:33:12 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%5]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 23:33:12 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
CC: "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs
 <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH v2 0/2] NVKM GSP RPC message handling policy
Thread-Topic: [PATCH v2 0/2] NVKM GSP RPC message handling policy
Thread-Index: AQHbh9gy2XzdAxeaDkK11ysKSP7B5LNZ+sMAgABnRACAAW41gA==
Date: Thu, 27 Feb 2025 23:33:11 +0000
Message-ID: <7544c343-e3d6-4f19-8531-b1b29fddd00d@nvidia.com>
References: <20250225225353.12642-1-zhiw@nvidia.com>
 <a18ca0098ed5f49d391377e2483b5cd9d44b65df.camel@redhat.com>
 <41dd7102-4600-49a3-bf82-bc8e584544e2@nvidia.com>
In-Reply-To: <41dd7102-4600-49a3-bf82-bc8e584544e2@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|BN5PR12MB9509:EE_
x-ms-office365-filtering-correlation-id: 9d8617f1-8b51-4b20-b9d8-08dd578719ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZFF4UC9BbGEvNEJZOGlmWktuRERkR0MrNVFzcE02MTFEdkVnS0E4cFNKMGJq?=
 =?utf-8?B?K2xMTEhTS3NkZk5UOVhEUUlQZXUvK3NqbnRsZ0hLckM2NThoTlVUQXpGdDd2?=
 =?utf-8?B?V3FCZTFzWXNDK2NHT2ZpK3FxU0FCQWtGVnJPeG84eSt4NzY4akJpTEVCK1VX?=
 =?utf-8?B?amFsUVk4dEQ0YW9IQUN4YWg0UWMyeWlDQk1LMU1HZG9OaTlaT3pvSHJLU3RO?=
 =?utf-8?B?d2NSWFVjbkFDcGRpekMyWHB5ZXI0U0lPK3MxRUkwUUxFWUlSWFpnMzRFQ0Nz?=
 =?utf-8?B?M0syaXJUbVJJMCszaGdIbHEyMW0xanpkVU5iWm5Ia3dYNkFKbXhkTWtIYkhl?=
 =?utf-8?B?NUluQ1FXck1tTlpaY3BaenJnakczWVhlMXRxS1RQekJTbisraEMySEN4VFow?=
 =?utf-8?B?d3VKR080NXpjOTRCVkxVQThhZnNXbm9CUy9lNFBDRUQySEdEelQ3cTY4bW84?=
 =?utf-8?B?V291YVRKY01GK0hDVHU3ekliaEx0QnRkdGZ5WTlMQUE4TVRDcThLY3A5eGVm?=
 =?utf-8?B?SmFKQUgrUkVPSG9BdzUxQnNQeXJhUXZjS3hXVFFheCtNQWMwRFp0ZVdqdTN6?=
 =?utf-8?B?czIxNUpUZDRtRHNTV1g4WU5pMTJYbldENWd3WGVOMng5SXd2MXlmbUI2Rm5r?=
 =?utf-8?B?N05uTzRESHo0UVo5RUlpdTJXeTJKaXpqam5CUHp2OVBmT3BwUllmdFJ0RWZZ?=
 =?utf-8?B?cE04Y3pqbzIzY3J4cUt6UDJzZHF3WjcrbGI1aDhHakNmMVNnbWgxSlh0b1ZC?=
 =?utf-8?B?K1BSRzZQMWFyTTNldC9hbDlsbG45bk4wMEoveHBiY0N2TGhVelE2N2xWdXBo?=
 =?utf-8?B?WitFb3NIdDAxY1FWaGJKVWM2QU9QNlkrZ1pNU3VOaVNCL1prc3lIWXpqTkRr?=
 =?utf-8?B?K2RUdEdEQ0dMbU1NdVVKbTRFdlBXb1U2QXNNZGxtdldvVU5SOXNCMlFuMlB5?=
 =?utf-8?B?bXAvc0tzUGlTbkJIZVo5VDB0NWVjeEI4cTByMENxTE9BUEg2RDIrcVNyY0li?=
 =?utf-8?B?YnVYOVlHTkc0eXdrdEZQQkhnRjh4bmhxSk5mSVExTVBIajg2VjhadlZiTVBa?=
 =?utf-8?B?aVhHbTM3S25peE9Wa0U5SFYvdDJqSitNZSttc3RzYlIrUW83UzdESkM5dnNX?=
 =?utf-8?B?NVYzYldVVjZtUVRDYi9xcUVRdGk2eGtobDVzbEhFQkFyNkdmazVoOGh1aW1X?=
 =?utf-8?B?TGlWTkJtNWoxZm5MYXd2ekpacUEyVWFQSW9Nd0FBaHN4TGFrMGVseUF4RFBl?=
 =?utf-8?B?bmpKbGVuaHRVMmhSWGxWVTVLNUtoOGZXR1Q3QUwyV0ZpNS9KbUQzb3FoQ0I3?=
 =?utf-8?B?YWw5WEE1M1FTRGVjMUE4U1ZUeFZOLyt4MnJFLzR0N0pFdUtDR0xLTUNnOWxI?=
 =?utf-8?B?cm1UeTNQc0RxUlpPL1lSelFZY1FjQkZieVR4SVU5TkM2K05xQzE0ZHZYU1dW?=
 =?utf-8?B?eCtjbmRXQmEwb2VMVExCMHBHRUFiUDRGcFhQS000ZlM1WUxBV1V4MTZlZmIr?=
 =?utf-8?B?VGFoOHU1M0tnbEFWNlVOQWZOdFhpaEtYNmpXMWNGQjdzOHJWMWYwb21rSUxn?=
 =?utf-8?B?Q3BmNWRZUU42SjlUSCtVWmk0OWd2NmFxamxvUzl5T2drTXRoL05rMDUzNUIw?=
 =?utf-8?B?WURFR29saktwZHBaTktEdzlobEx6ekV2SW5WTGFyVTZQNE0rYmc0Z2V6d2NT?=
 =?utf-8?B?dW5WcjdETXNDSXp5YXBOajhJNXEyZHYrTzNEeHFNUisyWnhkbzF3VW1TYVF0?=
 =?utf-8?B?aVpRRTBHUGdNalEzSHJTVDlFWEtKelcwcGs1cEJXaXFBWEllSXFESkpqdDNo?=
 =?utf-8?B?ZEg3VkZtWm1heVJ0OFZWMDEwc2lVWnRvazltUFJ3TTZoUDVIZUdvWVcyM01h?=
 =?utf-8?B?YUpORVB3cjBRVWFyY2ZMeUpWZ3Vkc2ZtOUQ0T1FDNW95VDI3WkRsS1BzR1RS?=
 =?utf-8?Q?d4+31jCoqs4T1CAZH55SDpytOGF8dSb5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blZ1RDlGVUt0dHlPbGh3MWtSNkVjNTRaNVM1d29TRS9hTFZwQW1vNHpCYUlZ?=
 =?utf-8?B?VHI3RGx5TDVLV0Z6dnUyRW9TUU5LdGFOZGJ5TGRsODdESDE5QUdZNnlqa0NF?=
 =?utf-8?B?NXlmbGtERlhTcjFTWDEzbU51QUV5MXoybHBtUytoYnJ0RmpPOGxRam9wUWwy?=
 =?utf-8?B?bnBVUnZKdWJIRWtUYW91d25zTXZtZTd6RytIYm9TbmdIV3pGYmttbHFLWXFG?=
 =?utf-8?B?KzhxSGwvN2tLbFpVekR3d29QV1A3Sy9oRGJHaE5La3ArSjV3cTBEdE82VWJD?=
 =?utf-8?B?UW8wdlF3endPcjdHa1Z6cE45NmFvNmlld0ppTjdHMGN3azlJZHJKK3hFM09w?=
 =?utf-8?B?S2djL3NnZFRKdm9GTlZWWk1RUUFTMWU3ZC9QdU00TTJwa2RKM0RSRlIvckIr?=
 =?utf-8?B?b2JTYm5wTVE1Z1g3S1liSWNsNExHcU1Ed1c0bDdpMzdMUWdOMEpXQ01VeHJu?=
 =?utf-8?B?SEZYRHVmTHRxOEwvUThzMHE2RkxWNnhYWmtDcjM3MVExYXJNS1R0TldweWR4?=
 =?utf-8?B?aUphK0RrcHRBdm9ySkRrVU5DNTNwcFFlL0xiTjgxcFEwNkxYS1gzaEU5bnFC?=
 =?utf-8?B?bTY0a2c1RGhiUm5zQU1wOVFCajFZak5lYzdvVXBXRUs4MU8xWEFxQkNqcTk0?=
 =?utf-8?B?VXRrUW9ndDhwb3pMbDJObkR6YkVtSjlXK2pyTTBXa0NlVWVRWTB5amcyK3Ru?=
 =?utf-8?B?UzBpWEJHdnczZE8remRrQVpiYUUrdFgzZWNWR1QrcU9TT2N2VGJPSE5ydWpB?=
 =?utf-8?B?aVJ2Um9iK2wwV1NmYVA5ZTVVU0Rnbjl5dnpkcXlzVWd0ek01VWY3ek5NL2pP?=
 =?utf-8?B?c3JueEVQc0VnZGlhdDVJUG1JbGliMExTVXZEaU1EOXlGbEFWSUtwRnNFUU9k?=
 =?utf-8?B?cmxKUU9RUnRlNndUSGhHWStCOG40eWlIUUhPNkRNL2xEUGRNdXpMdEUxQ2dn?=
 =?utf-8?B?aGRzdUJpaC9jaEhaQ24wQzdGaGhmSUl6WGg1TEdhaWd1b3lXbUIvYThpMUps?=
 =?utf-8?B?K3ZmL09tMkY5M3ZIcGxkV2VyRUU1WWc3Tlpuc0VzaWlBd2t0dGpHeXk5K3Uv?=
 =?utf-8?B?dm9nSDdUbk5yOVI1amZ5TG1MZFhOQmxwdGx6OTZac0x4UVE1YmlYYnA2UWNl?=
 =?utf-8?B?T1NXMENNdm5ib3BtK3MyQlhrWXBGOXpvUm5PN0E2bTFEWEN5RFpJQkU3SFk1?=
 =?utf-8?B?Q3k4Y0h6WTRicDNuVk9YK0E5SzZzcG45Q0plcnQxd1NqUkp4aHFXN3BSbzBY?=
 =?utf-8?B?TlA3eFppRHJqSGVKMzI5Q2Nvd1A0OGxQb0k1U21OeG4zY3R6SkNjMnJHRnpR?=
 =?utf-8?B?eFBLU0hIbVZ0MFE2U2k4cFVCOHdEYjdMVWE1bktBdVQ5OVRsYkphUEVkem9n?=
 =?utf-8?B?cVdIYTUxalA4VWs3UytINlcrUWczRUxvUE8xTGtpY2xzQkxManBsTlpmSlhv?=
 =?utf-8?B?QlFOSnhXWTFkMGlCcTN3bnlFLzNsZ25HUEkwR3ErQ0tmK0s1VzhVcVBwbVdm?=
 =?utf-8?B?RlVxYTdYdHNhY2U4ZE9QNHlqU0ZJWThlNWxmTUFTdTVuK0FSOVVwYlRoZWxo?=
 =?utf-8?B?SG9OdldxQjJJSExpakdWWkZPTTRqZjNac2tUV3M0cnEzYTk1TkxOM1NQUVZt?=
 =?utf-8?B?eERJbElGM1J6Qkx0VVg4NFBiRldjeHFWREpIUEkzQnpLYVg2Ym8zeExIOEVx?=
 =?utf-8?B?eW1MVk55ak9JMjBObStSWjR2NHN4RmNjQW5SK3pKck93S1F5UFhkQWpYdmJM?=
 =?utf-8?B?ZGcyc1AxY3FOQ2ErRUt3OGplQmt5YVJ1WVdCRk1aNmdxL3h6WXpwUU9TY2Z0?=
 =?utf-8?B?czNwei9ibWlNZmZ0U2ZUQ1paYVF5QlpUNjd3S3BYNURHR296b1VIUmRkK3FF?=
 =?utf-8?B?QkE2aCszRE5sbzZobllUUGsxUWxpR1pka1p3bFZ3T1V2U2I2aENPbGVZejR2?=
 =?utf-8?B?a2NIZFgreFE3Q3ZiMlBta2lxK25RMzBVZndNNS9JRTBVemFQemJUNzg1RVVT?=
 =?utf-8?B?Y3M4UXQrRXhvcXBNOEV0bGtnOWhrb2hHTXJwTlhpdmVSbkt3ZlEwS0xxeEJ1?=
 =?utf-8?B?NGdDNmFmdmlMUiswV1hNUE1EekVBQ3JMRnoxRWV3TjhYcHVtSGJSc2wvU0pL?=
 =?utf-8?Q?43bc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C680FD1809F4D94D904DB631F41B0DA6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8617f1-8b51-4b20-b9d8-08dd578719ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 23:33:11.9295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4D61M9i/7DSD8vMTBoDbV6iZWeF8AKgsO8kge6QA0e6T69J76qeqRBXY1z0WC75y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509
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

T24gMjYvMDIvMjAyNSAxNy40MiwgWmhpIFdhbmcgd3JvdGU6DQo+IE9uIDI2LzAyLzIwMjUgMTEu
MzIsIEx5dWRlIFBhdWwgd3JvdGU6DQo+PiBGb3IgdGhlIHdob2xlIHNlcmllczoNCj4+DQo+PiBS
ZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4+DQo+IA0KPiBIaSBM
eXVkZToNCj4gDQo+IFRoYW5rcyBzbyBtdWNoIGZvciB0aGUgUkIuIEJlbiBmb3VuZCBhIGhpZGRl
biB1c2UtYWZ0ZXItZnJlZSBhZnRlciANCj4gZW5hYmxpbmcgdGhlIEtGRU5DRSBpbiB2My5JIHJl
LXNwaW5lZCBpdCB3aXRoIGEgbWlub3IgZml4ZXMuIFBsZWFzZSANCj4gcmV2aWV3LiBTb3JyeSBm
b3IgdGhhdC4NCj4gDQoNCkkgbWVhbiB0aGUgcHJvYmxlbSB3YXMgaW4gdjIuIEl0IGhhcyBiZWVu
IGZpeGVkIGluIHYzLiBQbGVhc2UgcmV2aWV3Lg0KDQpaLg0KPiBaLg0KPiANCj4+IE9uIFR1ZSwg
MjAyNS0wMi0yNSBhdCAyMjo1MyArMDAwMCwgWmhpIFdhbmcgd3JvdGU6DQo+Pj4gSGkgZm9sa3M6
DQo+Pj4NCj4+PiBIZXJlIGFyZSB0aGUgdjIgdmVyc2lvbiBvZiBOVktNIEdTUCBSUEMgbWVzc2Fn
ZSBoYW5kbGluZyBwb2xpY3kgd2hpY2gNCj4+PiBzb2x2ZXMgdGhlIGlzc3VlIHJlcG9ydGVkIGJ5
IEJlbi4gTW9yZSBkZXRhaWxzIGNhbiBiZSBmb3VuZCBpbiB2MSBbMV0uDQo+Pj4NCj4+PiB2MjoN
Cj4+Pg0KPj4+IC0gQWRkIEZpeGVzOiB0YWcuIChEYW5pbG8pDQo+Pj4gLSBNZXJnZSBzb21lIHBh
dGNoZXMgaW50byBvbmUuIChEYW5pbG8sIEFsZXgpDQo+Pj4gLSBJbXBsZW1lbnQgdGhlIHBvbGlj
eSB0eXBlIGFzIGFuIGV4cGxpY2l0IGVudW0gdHlwZSB0byBsZXZlcmFnZSB0aGUNCj4+PiDCoMKg
IGNvbXBpbGVyIGNoZWNrLiAoQWxleCkNCj4+PiAtIEludHJvZHVjZSB0aGUgTlZLTV9HU1BfUlBD
X05PV0FJVCBmb3IgImNhbGxlciBkb24ndCBjYXJlIiBwb2xpY3kuDQo+Pj4gwqDCoCAoQWxleCkN
Cj4+PiAtIEludHJvZHVjZSB0aGUga2VybmVsIGRvYyBhdCB0aGUgc2FtZSB0aW1lIHdpdGggdGhl
IGNoYW5nZXMuIChBbGV4KQ0KPj4+DQo+Pj4gWmhpIFdhbmcgKDIpOg0KPj4+IMKgwqAgZHJtL25v
dXZlYXUvbnZrbTogZmFjdG9yIG91dCBjdXJyZW50IEdTUCBSUEMgY29tbWFuZCBwb2xpY2llcw0K
Pj4+IMKgwqAgZHJtL25vdXZlYXUvbnZrbTogaW50cm9kdWNlIG5ldyBHU1AgcmVwbHkgcG9saWN5
DQo+Pj4gwqDCoMKgwqAgTlZLTV9HU1BfUlBDX1JFUExZX1BPTEwNCj4+Pg0KPj4+IMKgIERvY3Vt
ZW50YXRpb24vZ3B1L25vdXZlYXUucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDMgKw0KPj4+IMKgIC4uLi9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9n
c3AuaCB8IDM4ICsrKysrKystLQ0KPj4+IMKgIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvYmFyL3I1MzUuY8KgwqDCoCB8wqAgMiArLQ0KPj4+IMKgIC4uLi9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvZ3NwL3I1MzUuY8KgwqDCoCB8IDc5ICsrKysrKysrKystLS0tLS0tLS0NCj4+
PiDCoCAuLi4vZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9yNTM1LmPCoMKgwqAgfMKg
IDIgKy0NCj4+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pg0KPiANCg0K
