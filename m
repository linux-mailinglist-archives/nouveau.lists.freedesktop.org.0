Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405EB21808
	for <lists+nouveau@lfdr.de>; Tue, 12 Aug 2025 00:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F225310E564;
	Mon, 11 Aug 2025 22:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hNntpcRh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9021410E564
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 22:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp8stUxiU3K8rv+grsrqYYEybb8RGhbhVf2Q2XU23CBeTVtiB4mK2AHp4YmNHAYwvEIBn6dRUjvq7oSksBwuI93pIn/EjTlRNLc5sIIMMjfBG5GnZ3eSuCi4QIlbM24JwereLxt0GPiASLg0qbLU1dBTldQbEfj1q1C2VRn6IFen60hFdoNgfE+s6GCq2Go32v9zCkwMSbHt1dGno2EE7Y6vbhJB4KcN8JCttXBUYxiJvbJbfz4UeVEzgH0F6LGI5CmQdavEwyFSZO0IzvzooWqu6eRpS1+x8umhOvafUbQqWuLeHsHUZI6/CCeAXsTGlCewLtOX/cIStn8Uc2y8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWCuBC1w0QQYOpPbbX80qwgZSD4IHcMxh40HS1xk3d8=;
 b=O5VB00t7nW8W3rzjtxw+GYdn4OXtlfE+Mg4iZROqBtVsUbLDK7f/ueLXw2+pJReHRTkgsNF4WPoBQnLxggfX7ncMC1RagLF52MAEB3cTPO8qYGfqvW4vV7XLEwyN03k0TjqVw3TNBCu5w1dqp2hZ60FOV3NLHxHDPVEFQg/zQmP+inttcCw48YZ1K1LyIfwxESiTA+laAU6JaH5Vj4XPGECGXjlGMNPpmwwpht3DSrjIO4xNY911W57jshA6Nk5lSXelV3TxeQQSJzhjcve3qi99ad4MLU+YqehtmGr3s2sd4+oSKwY/b+kTEVUqgCyI3pJBXLkNfrT9ayalvrjL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWCuBC1w0QQYOpPbbX80qwgZSD4IHcMxh40HS1xk3d8=;
 b=hNntpcRh2PM+GXaoosZ43hCPgV/0Sq3FJ/GMZbtFSiVMaB02uiA+pt1SlNJUGr9idgRK21HcQE5aYvCz94y0v5UbpIGZpT4zwC3Fv0CK/JxfdrjojTnt5buL+Q8GBw5a3VarUP0j6DM8e+h7D6YUIblPs9Dje/W7wnLGMFrpeQfcT6chyYVhxtx2hbwsZcsTWyq2SJHW9VmYTkyHTsCQn3gOd4eIaH0gMgld1xkXxQA/mwbvNoy54KV8f4nnad0PDV4ux+bUc8nJ+DQ9fcdTWParuxOCJRtGPwDblZTG5Snrzt/mQaOYPsqbUdixYA1ZtVkNwOSmLRpPgkKOAtB92A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 22:16:25 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 22:16:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
Thread-Topic: [PATCH v2 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
Thread-Index: AQHcBXWxeaACUk6pUUatL5p8MiV8SbRaNe+AgAPaSwA=
Date: Mon, 11 Aug 2025 22:16:25 +0000
Message-ID: <226b6b7ee2c40f4b6d8ac77d3c7b14296df5b2ab.camel@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
 <20250804192601.10861-2-ttabi@nvidia.com>
 <aff2be6d-0c86-4712-b198-a3efc43a015e@kernel.org>
In-Reply-To: <aff2be6d-0c86-4712-b198-a3efc43a015e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB5868:EE_
x-ms-office365-filtering-correlation-id: 1a852da0-249f-4179-2baa-08ddd924b61e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmdBRFUyZzhUMXk4Z29xZndJQVRaQlNHWkcvbTN4enZ1eDlVVHVlVUVTNDF4?=
 =?utf-8?B?WlhWd0dkYnhKdHZpbjdaQ0FiejV6YitXcFpUMTBKaVdSWUk1VW9sd0NKQ0No?=
 =?utf-8?B?TG84OFJXK2Y2eDFQaUF1cm1qUVprdDRWSlRHY0lyMjAzL2FEbjcwOXFVQUhC?=
 =?utf-8?B?bW1hcFVZSHJYZEc2eG5xMU1JYmozTTRyQW03Y3RKS2ZDcWNTVkNiS0dSOFNi?=
 =?utf-8?B?Q0x1MnZSVU5LTytycWFHSlM2OEdoYzhwaEJ6aXpkckFEbGZxSVNmSm9WaE8x?=
 =?utf-8?B?TFYxa0NldTdrYjg4WjBVV2ZvOTMvMXQ4VmZBNnlMR0FiTWdxeFJXU1pnMHRm?=
 =?utf-8?B?NVhtK0xhandHejNGOUUzZy9VVWFyeFZHUjlDWHo2dmFnLzJMRG9nb01WV1dp?=
 =?utf-8?B?NVl0RWNQY2lZTnJ3S3NiQ0hONHd5aHpsUjRNMFZKRzhCOURmSmdCS0gxVXNM?=
 =?utf-8?B?VXZNSW1CQTNIWER0K2dTMEtQQ2FIUHBPR1JFM1AvUEVWQUtqWFh1SUFxOXVt?=
 =?utf-8?B?ZDVtaDJqclZMakg4NUo3VzdRR2VkUnVxNHU5OVRTMUxKV3dTVFhrbVhueEdv?=
 =?utf-8?B?NTMyU0IxMEJ1K3Nibjl0a1hqMTgxcGpNOUFNNEhQNTFPdytXb3c3VTlDUSta?=
 =?utf-8?B?Q1NKeG55NExaUXdlWHpFaENJQUFQQWREdTUvOXlqbEU3Zm84UTYwWXRVbzN2?=
 =?utf-8?B?b1hpSk9mWDRsWkVWMFNtcXhKTnVoWnJSVVRsRFJLd3piblR0bmx0dzB4WThm?=
 =?utf-8?B?Q1ZuSEhqV2U2VXZ4SjFJUGF0eXh6RVZFdm11OS8xbVFaVmF5R0lwdHlLeTRs?=
 =?utf-8?B?UlRwOU5hYWQ2bDdhNnBQWnR3dWprS01oM3FGdTVRYklVYXlEYzRNdUYySnJX?=
 =?utf-8?B?V0t5KzB0OVBUSDBhYzJNK3Z5YjU0YW04UmRRbm81MXd6cXFQWVhIdmlVSW8y?=
 =?utf-8?B?WHNiS0VqNUpYT1NXYVJvT1hid3NpZjFKN25MOVFZZjhRaEpEU2hOWTB3R1JB?=
 =?utf-8?B?U1h2VWZ4RFBBS21SMmpRNFpDMmVuaytrWlZlUFFFdjdNcjVBdlQvTG5sUXpu?=
 =?utf-8?B?czBBTDJwSDZVRVR4S0xDNjRUbXl3NFZ1enpDZDVndkJHSDNUTC9VMkFKUHRC?=
 =?utf-8?B?bk92VWRMU2lmZktjelpRRVZPNVlSUTV0UFRmRnZHalhwRVp0UE9iQUJKTlN4?=
 =?utf-8?B?My9XRSsxS0FSbHdRSnM2U2wyN0UxMFlPcWZNQmRDMEp6U3RRSTM4dGtNM0wy?=
 =?utf-8?B?Z0NRUzhxWldwSENHdmdMdVI4S1drRm1RNjIzVmEyd3p5Z25uRWx5cnYxajFZ?=
 =?utf-8?B?Ykd6Y1NCOVE1UTc2Rml3Q1FvWEFXT1dROGxIYWJKTXU1N05LUGNNSDlnc2Nl?=
 =?utf-8?B?dVpSYUgzM1lFVWpQQXp5TjgzWkdoVnR5QU1NSUdaOTlTcEd0ZFJpSTFXSmJp?=
 =?utf-8?B?MElSK09HRGJ3V2czcUxzaDJxaVY1N2JTMGhLT29WSXZOdGN1MFIxaW9RbTlW?=
 =?utf-8?B?cFNDaW9WM1hDRlJhU24xbzBlM2swY3F2MDUxV2VIbEJJaUdQdlNkcGRpc0kr?=
 =?utf-8?B?U3prLzNCQWVIK25YV2cvSzBWYXBybU1MNCsvcEZMcHBzZWdTaDZyYkFlRXZF?=
 =?utf-8?B?a1I1N09kRCtOYXgvNllMeGEwWXFXVk9jZFlLVVgxSUdDcjU3b0o0c05FQjlW?=
 =?utf-8?B?dXZYRHE2SlRSUnBJSlZYTko2d25yKzdybU0wVmc1Z1RQalEvY3dNSkQ0b2Q2?=
 =?utf-8?B?dGtKYThzRzV3aWp3a1Yxd25raDJhWG5kL0NCLzA0Ukl6dlRaU0pvRnJjMERx?=
 =?utf-8?B?MWVDcWg2djk3K2xJclZHVjVpb0pRcnNGOTJpRkNqRWxjZ3hFek95R3EwdllM?=
 =?utf-8?B?TmdQMVFtb2pkdlQ3RTRNeWhsOUhsbkxURDJycEF0dDdZSnBFWkxBb3hCSGc1?=
 =?utf-8?B?NGp0L3JJdDIwajZBTFQ5RXV4KzV5U3RSNjFNbEhxS1FzMVBnSFdHTEphcHdm?=
 =?utf-8?B?SVlSY3Y3VGVRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2orbFhDeVJHYlBrR2IzN3JaZHJGWHpKSStyU3B1dGV5TG1NN1RkSVBRaGpx?=
 =?utf-8?B?eWxLL2NLT1FmVjMyd3BnSFkrU2JOSUVUNm5vWk9MLzZDMzVZN0krRGZwbXA4?=
 =?utf-8?B?aHRNLzVraERJMnBtdjF2ZDF2UHZMZVFXajlXN1dXOGtackFRbjlhd1hSYnVh?=
 =?utf-8?B?c3BCNCt6M2NtMVZLdWQwUnVGV0VhM1J4aGx2V25OQ2VmaE51WEZWZVJtU0tH?=
 =?utf-8?B?bHdXWDdZVFFtNXV1VEIvMWhkVEdGSURETW5SanhZdDdZcktCYVpyd3Z4SGd2?=
 =?utf-8?B?cjF1UXZ1bUJYa2NBQTBpR1hTTVBCK3YxRXlISHdZcE4wWVJFSlZmaXJTVkUw?=
 =?utf-8?B?ODhMZW04QTFRVzJyRnVlbzlYN2FCMkk1aWhXazFxQ3NCRFZtcnY5R3lGU3lt?=
 =?utf-8?B?dUgwYkRCbGNIakdjdDJ1aDlVSUFmbzBsdUhpVWM0SXpZTldYQ3VJU1RRRXND?=
 =?utf-8?B?cTlIckE1Z1JnMllhVlZkNldXd2FSbW9mUVBxMmpaTjNZaEtqQ1haaUpoV2Nh?=
 =?utf-8?B?R3BSanozOG9KMlVXRGppaURTa1k5cTF2VzZQTDQzaVZ5QU1uLzNObUo1bENO?=
 =?utf-8?B?UWw3NU4wZ2NLalJwMU1DYjZEV3Z1QzEyNTZ6K1liQWp1VHdRYnZ6Rk11WWpu?=
 =?utf-8?B?TE1TZGx3N2UzU0dDMzBKU2V6Tk1kTGkzaUtLVnJ0czE2alcrVzJMMlh2Mk1I?=
 =?utf-8?B?Ym1CODI1ZkN1eXl4NEdUMmVDeHFueldVUlhnRzJZeURkcU1TZTUzQURnbW0y?=
 =?utf-8?B?bXN5TE5JaGltYmo5SGsrc0hSM2ZnUW5nS0p5eGZ0VDVQVnV2MGxRbERSdjY0?=
 =?utf-8?B?cUh6MHRIMkptczJOMWlnMGttL2xzU1Z6MkFTVEZYQnNwdU5nVVE1Lzl2dzda?=
 =?utf-8?B?UHh4WWlZY0JJcVg1aFBETG9hR3ZFcUZDWWRXVHpKdEVTYXJMRGU2cTNHM3ov?=
 =?utf-8?B?cFNqclMvSGQrTVBxVVFmOFFqNUZMZC9ST1p4ZmV0UmlzR2o0Z2UyYy9zSDYr?=
 =?utf-8?B?ZjZyQVkwem5wSlpTODRQQ01PcWpsNEhBM2ZPNTdHd3hOTjRqWkZUeEhBamZD?=
 =?utf-8?B?cHl3dlJKMjlLQTAzazhsUHNVN1U2L2JaVHRURzVEOWJiR2k3YUdZMUVEWkxx?=
 =?utf-8?B?MTJmcFNobWR5bTJFWWhjQlB0cWdJS0ZxVjZtdGRWMGorZmFIdVhBQ1VzL2dC?=
 =?utf-8?B?OS9YdVFTRmtGMzRoYU0xeTZ3NXlzaXdNdzJxRnZuaWt1Q2dvUVd2ZGVxY2lp?=
 =?utf-8?B?aXV1MDB2LzlYV01hOG9XM3drSGR2WmltZnhvWjREZFJES040WkYxUzdUamti?=
 =?utf-8?B?bjJuSXFHajFnUzZFWlhTZVRzTDd6c1A3YUd1M0kvTjRWdFB3TEZJWm5BUTRF?=
 =?utf-8?B?Y2p4R3MvTGVzbkVUNDBQYWJBVzArQnRPZmJ0TlJKc01GQ1AzTkVZM0xFMVhK?=
 =?utf-8?B?TlczR0Z5SVVFR01VNUJHR1Fpamx6ZjJvMzhZL0FISzJKRGRlU3pNY2xTWWxm?=
 =?utf-8?B?NVdFVlo3bVpQNkhtVWFJcjJIcHFQVW9ucTlJdE5ScW9uaUZ1ZTYzcFJ1emM3?=
 =?utf-8?B?ZWpsSkp6L0VzL09tOEtUdUFFblVuR2hnUFZXOHJkUXBTb3Q1a2IyU1VDRUpu?=
 =?utf-8?B?NWFUNFg0YnM5dFhIR0VWVFdKQ1Z6bzcrdkVxNWFuZXM3YnF1T3lxSGg3VjNV?=
 =?utf-8?B?N25mT3hMZ0U2a01RZmIydEE2N1RMYTlVZFRubHRYT3d6RjlmMlZnTEtKVnA0?=
 =?utf-8?B?Q1NYV0d3bU5lcHlKeXNpRUwva0lKanZQZHRjenRSb1kzTzdPVzZvbVlvMWFt?=
 =?utf-8?B?SHB5V1BndzY5bkJjLzVsUXgvN3RBUVFSRzVRWTVQYnJyazdGdklCZXp3Y2Q2?=
 =?utf-8?B?dlVzQlZNc3dubWVRdTdrUDFFSU44YzlFMzRyYTNCakcyNHZkZ2VlRllEQUs3?=
 =?utf-8?B?WWVBN3FwWVBWL1pXTTBaMitLZDNmTThpNHltVnoySWNvTmhNOGJjbFRic1cy?=
 =?utf-8?B?TU9aOWZHREJFNnhVWTlRSkRrMGkvWXhEeXVXSEZ3MkZMZXJmNUplcHg1OVVj?=
 =?utf-8?B?b2NXcFM3K1NnckZRZkoxcHFjRGgzV0w5ZzFzUFgxZDNIaHA2L2hmWGRUZ0hv?=
 =?utf-8?Q?jnTfDsXlOlJjU4XXPBw7Mx3ob?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ED6E817BB29744D83FD1A6E97D60528@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a852da0-249f-4179-2baa-08ddd924b61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 22:16:25.3751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7KCRZjnqz+sp6KD40s6hFEKoMZshrI15XatR4NEG2qYmFmOyXCUienLV4LB3MHzxKWO3Opx0zT7XVrFY0szUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868
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

T24gU2F0LCAyMDI1LTA4LTA5IGF0IDEzOjI2ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICsJaWYgKCFmdy0+Ym9vdCkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gDQo+IEdv
b2QgY2F0Y2ghIEl0J3MgYWxzbyBnb29kIHRoYXQgeW91IG1vdmVkIHRoZSByZXR1cm4gYmVsb3cg
dGhlDQo+IG52a21fZmlybXdhcmVfcHV0KCkgY2FsbC4NCj4gDQo+IEJ1dCBkb24ndCB3ZSBhbHNv
IG5lZWQgdG8gcmV2ZXJ0IHRoZSBwcmVjZWRpbmcgY2FsbCB0byBudmttX2ZhbGNvbl9md19jdG9y
KCk/DQoNCkkgZG9uJ3Qga25vdy4gIEkgY2Fubm90IGRlY2lwaGVyIE5vdXZlYXUncyBjbGVhbnVw
IGNvZGUuDQoNCklmIGl0IGRvZXMgbmVlZCB0byBiZSByZXZlcnRlZCwgdGhlbiB3ZSBoYXZlIHRo
YXQgcHJvYmxlbSBpbiBhIGxvdCBvZiBwbGFjZXMsIGluIGJvdGgNCm52a21fZ3NwX2Z3c2VjX3Yy
KCkgYW5kIG52a21fZ3NwX2Z3c2VjX3YzKCkuDQoNCkF0IG9uZSBwb2ludCBCZW4gdG9sZCBtZSB0
aGF0IE5vdXZlYXUgY2xlYW5zIGl0c2VsZiB1cCBvbiBmYWlsdXJlLCBlbGltaW5hdGluZyB0aGUg
bmVlZCB0byBjbGVhbiB1cA0Kb24gZXZlcnkgInJldHVybiByZXQiIGV4aXQuIMKgWW91IGNhbiBz
ZWUgdGhpcyB0aHJvdWdoIGZ3c2VjLmMgLS0gbm9uZSBvZiB0aGUgcmV0dXJuLWVycm9yIGNhbGxz
IGRvDQphbnkgY2xlYW51cC4NCg0KSSB0cmllZCB0byB0ZXN0IHRoaXMsIGJ1dCBJIGRpZG4ndCBn
ZXQgZmFyLiAgSSBtb2RpZmllZCBudmttX2dzcF9md3NlY192MiB0byByZXR1cm4gZmFpbHVyZSBh
bmQgZGlkDQphIHRyYWNlIG9mIG52a21fZmFsY29uX2Z3X2N0b3IoKSBhbmQgbnZrbV9mYWxjb25f
ZndfY3RvcigpLCBhbmQgdGhpcyBpcyB3aGF0IEkgZm91bmQ6DQoNClsgMTI4MS4zNjEwNDhdIG52
a21fZmFsY29uX2Z3X2N0b3I6OjIwNCBmdz1mZmZmOGU4OTgwMjJmNTQwIChudWxsKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAxMjgxLjM2NzAzNl0gbnZrbV9mYWxjb25fZndf
Y3Rvcjo6MjA0IGZ3PWZmZmY4ZTg5ODAyMmY2NDAgKG51bGwpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgDQpbIDEyODEuMzc5NTAyXSBudmttX2ZhbGNvbl9md19jdG9yOjoyMDQgZnc9
ZmZmZmNmYzM0MDhlNzkwOCAobnVsbCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
ClsgMTI4MS40MjI4NDZdIG52a21fZmFsY29uX2Z3X2R0b3I6OjE1NyBmdz1mZmZmOGU4OTgxMjQ4
MGQwIChudWxsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KWyAxMjgxLjQyOTMy
Nl0gbnZrbV9mYWxjb25fZndfZHRvcjo6MTU3IGZ3PWZmZmY4ZTg5ODAyMmY2NDAgYm9vdGVyLXVu
bG9hZCAgICAgICAgICAgICAgICAgICAgICAgICAgDQpbIDEyODEuNDM1ODg0XSBudmttX2ZhbGNv
bl9md19kdG9yOjoxNTcgZnc9ZmZmZjhlODk4MDIyZjU0MCBib290ZXItbG9hZCAgDQoNCldoYXQn
cyB0aHJvd2luZyBtZSBvZmYgaXM6DQoNClsgMTI4MS4zNzk1MDJdIG52a21fZmFsY29uX2Z3X2N0
b3I6OjIwNCBmdz1mZmZmY2ZjMzQwOGU3OTA4IChudWxsKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KWyAxMjgxLjQyMjg0Nl0gbnZrbV9mYWxjb25fZndfZHRvcjo6MTU3IGZ3PWZm
ZmY4ZTg5ODEyNDgwZDAgKG51bGwpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQoN
ClRoZXNlIHR3byBzaG91bGQgbWF0Y2guICBGb3Igc29tZSByZWFzb24sIHRoZXJlIGlzIG5vIGR0
b3IgY2FsbCBmb3IgNzkwOCwgYnV0IG1vcmUgZGlzdHVyYmluZ2x5LA0KdGhlcmUgaXMgbm8gY3Rv
ciBjYWxsIGZvciA4MGQwLiAgVGhpcyBkb2Vzbid0IGhhcHBlbiBpZiBudmttX2dzcF9md3NlY192
MiBzdWNjZWVkcy4NCg==
