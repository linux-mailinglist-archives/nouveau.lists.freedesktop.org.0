Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C61AA7B4C
	for <lists+nouveau@lfdr.de>; Fri,  2 May 2025 23:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0884D10E201;
	Fri,  2 May 2025 21:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V2LF8Xkm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B092310E201
 for <nouveau@lists.freedesktop.org>; Fri,  2 May 2025 21:19:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSat/YrtRbz6EPnz8hSHLnFZW1KYC/G7V5gV41Tr0yCdOMBuXZy8gPCFz2MISIgRf9YPAGiONv1Uyw1RSE/CT5lrHe+F+REtLPeUE39k4fJc89G49JBJN5ReBLaZ8Rqu0Z4NX+RQGT2ZYx/Y3XqGDaB+nU0rbSffMeEuLfWnNzDhrVGG5kx8NPr5hxQsi1iEuWUxNGVEknpqrmp1MUilm8wikdbovDkFjVmM8yWbmyrbiaFjCHG2LSVnXj7mRTJBSffzEWEB8hWTA5rMHQFtFu4bGXckgh89dowZoDRcfU0NgKgNoTT6iu8SwYs/ojxCKPfbSZYoBSDfSLl0i1qi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqD1+VCeVbTaZdU7swgPy2UZkjwsZz4E9LLuy3UOqtU=;
 b=jHi3o624AjedH/xPmpqSkVkhki1PwdazXIIhc8pg9I1WCX/xcctDufMCxFKVpp/JDpsi60HRPmSmumn4gsNNwYWJQu4nTZVdzpCz+NDkyBjeVpUVfjyySkqZDjntojLQnQehSH7U+Cy/3hjBUlurob1cigrcU5iN/ymMfc/d6b+W8qmhPOlK6Hrbx2ICPl3ZjyUGNhyPQTJEiM2QcN58LoZoQsbRl+dXmvheq2hK9I4XzG3uVlAe8Y7+Ukk7tk9ob0xSQxLAUtwFAFLHolprhk7D4vFLXiZlY/JR8tPQjdrCvfQD63WJ/s2NDXIfqPBanDxxHVCSwJXekpzj/jGP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqD1+VCeVbTaZdU7swgPy2UZkjwsZz4E9LLuy3UOqtU=;
 b=V2LF8Xkm82zrUxYzmEWf0O7sa5XLUBbLs+dMbCKM24EaouryM+FvTGwlAzG5EsY0latxGWmJj65Vy+k1oHfZ93kE9dzp+2pooD/jLfy1B83HWcxLEM7nguK/XWatH2sG5LfSiGHuDgg6ZinXoVXGnuxYY1cF2z5vz7VwurH5MHMRdMWhHKy61k8bvVZMAgO6dRjRtfoH382cdBx7U8HKaSm1v9rTPvD0SRJPVe1/clRlgV7DrkF2EwyCL+YyboGnKuTZMMKMZoPonji1xXl8PYKGy8e0KdLbDslvYMqmlRqskZ/tCUZrFxTBf9m0tyfBBg5okgMaWBOv2X+K9Mbv6Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.38; Fri, 2 May
 2025 21:18:53 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 21:18:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>, 
 "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 00/60] add support for Hopper and Blackwell GPUs
Thread-Topic: [PATCH 00/60] add support for Hopper and Blackwell GPUs
Thread-Index: AQHbuWAQv8vQgiOLykW3Ci6b+LfR17O+uamAgAEjMQA=
Date: Fri, 2 May 2025 21:18:52 +0000
Message-ID: <e2c36ec2210e4e04b0e880e0da6a95629e3c73e9.camel@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
 <CAPM=9tyVnyOFyg=fUWwSXdCzn6VMpt-UQuHe4kmO2XvgMOjQGQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyVnyOFyg=fUWwSXdCzn6VMpt-UQuHe4kmO2XvgMOjQGQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH8PR12MB8607:EE_
x-ms-office365-filtering-correlation-id: 364379fd-da44-4cfa-f826-08dd89bef090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YWNtaXVmY2Q2dVVTcnhldnNsazU2UCtvbjFnMkZYdTJEdUFvdG9zSWxyRVpu?=
 =?utf-8?B?OC9ZZ3BBVHdnZ3pEZndGWHVkN3FPRURhT2RLMGt4M0lmSllyVkF2UFkzamdW?=
 =?utf-8?B?YWg0dytMb2RHSmljUjA5c25ZWEJHdDNUQTViQTNxT0ZYY1RydWo1YSt3SXBq?=
 =?utf-8?B?WlJyeEFnTHAwUDZFS1g3a2I2M28xZzZwRzFsR1VZSkxJejUyM0xub2I5V0Fk?=
 =?utf-8?B?MVdhem41T3JkQ09QcTBVdlpuQmEvOUY4RmRMQXBUK2FOdVQ5UUpVZFRnUVRv?=
 =?utf-8?B?bEltN3FZSGhaOWc0ZC9JMlAycmQ4VktkUWZ0S1hKSzBjSENhKzQxRzlBNS9G?=
 =?utf-8?B?WmhkVnR1S0krM2JVQUNBMkRhMHN1YlJxditGd05KKytzampOMEJuT3A1U1Ns?=
 =?utf-8?B?Q1c1Rnh1dVFQeGkvMml1c0NWSFZaelFzSUdqZ0d4RzZCekxpc0xydEpUYzh4?=
 =?utf-8?B?Q0ZGR2lyNkFuaHliT1Vmd2JlU1UzUVVpYlBHeEpiYmRZNHU0R29tdXdWQzR6?=
 =?utf-8?B?bVRIV2trejM0V3BNYVJ3OHBoMVkzYUdoVWFYTVNFdVhmRWxrY2QweTVYNHRR?=
 =?utf-8?B?Y296VFoxMlBrcWg4QjY4ekVBM0NVVGdwSlVqdFFpWlEyL3IyamE2aW8xcmNQ?=
 =?utf-8?B?YkcxNDVtU3dmdVd5SUNIa3BzdjlwZjVCRWExMWdBU016ZVFxMjVZeXpFVGtx?=
 =?utf-8?B?RXVMNUx0b21PQ2NaRHpnZ2Rjb2h5N0FHZW8zTFlOcHd1Ky9NcGJYbU9xVTlz?=
 =?utf-8?B?Y0dpSkNDYVd5TmhROVhwTFIzMjJZYlFMYzg1ODVSU0cwMmVLNERsNnNTWTFF?=
 =?utf-8?B?RlRLRm43d01NR09pMXVKaXd4NU04R0VTdjg5SklLZUVGOEo1cER6SXVvWjVW?=
 =?utf-8?B?bXk2NFFwayt2c3o0aWp5ckh5YUUydXVNbGpGL2hGOFZRRmMwU0dEbUllSEZl?=
 =?utf-8?B?eDk1WG42QzVCai9vZWpWNFVOQWRQUWhINUVGdWY5TlV4OHJYYXhhUXRvQy9l?=
 =?utf-8?B?L08zUHdGVHl0ZTBsMlRnL2RrTVhxRXV0ZVVBTThUTzdHM2hpR0pvSDRjOUZB?=
 =?utf-8?B?aHBRVzV1cVMvZE0xSXFoN0NVNS9Nck9Gdi9RUDJFZlBUTVRVMmpodDc4TG0r?=
 =?utf-8?B?ZlM1S29QQXozNDVRSWhyR0dHWnBNM3pSZElXNUUyUFdQa05UVE9pM3AvN3dr?=
 =?utf-8?B?MDR0L2xSbkEwZzNxK3NDc3Nnakt5OHVPUmJWYmFvOFFaS2xpWDhMWURqN1pX?=
 =?utf-8?B?eWlINnBDUFEvRm5nK0ErZUl0S0VxY293bDNSMkRsUWIyQWpUQnkrbk81RUdv?=
 =?utf-8?B?U0hHZUREdUN2Um9wMjJxZE9kQk5FUTdnSm56VE9sam5vWGVXTU5JQlk5bTNH?=
 =?utf-8?B?Y0Z1OHN1UE4wRDBpekNRREdEcXJVZlF6ZG56d1FqTk1jY2pmZWR5T3dLYkl4?=
 =?utf-8?B?MDBCd1piSk1mMDVGTWJyYUttcnlxS1U4SHpkN2pvYlB3WWpLV2N1MXRDcEtQ?=
 =?utf-8?B?R0kxZ0tYOC9XQjFNNHVnWklpTFJvRFBEM3RoTTIrNStBbnl5NGtNa0FYZFdM?=
 =?utf-8?B?Q1lzZTNOZE9NYkxTSHFPckhFYVJybm51c2h1d0VYN3gzYjlYbWhZaTZXVzZU?=
 =?utf-8?B?WUZkRGpaTFNpcEJCaG9lbTltN24rYzk3NWlxZWlJOWFvUlpqOGxxdTk4WUtp?=
 =?utf-8?B?b1c1Z2JlNWx3VXB4TFlTbVpnZ3E0ZXJSY1Y3TXFtZEVGMHN6UkVpVnJUbGhv?=
 =?utf-8?B?ME5sazh4S2lvRmxweStTK2QxZVJVRmNCaGdnYzk1bHVvZjIwWEZqR3dNUVp5?=
 =?utf-8?B?UGpvWUV2ZVpZdTl5UThGQ3FTOVNWL0FSM3pzVVRMMkhrdjJuN2JlYytTb3NU?=
 =?utf-8?B?TUt0cmxFSmppOSttaXB6dmpoTFVYN2Y3Ump4NEVFdmZsdnRqOEgzNzNyL2JJ?=
 =?utf-8?B?UkFPcVEvaFN3bDMyTXJXb0xaTXQ2b1NoYjM3YkxTM1VUUFM3TmdiL085OFdx?=
 =?utf-8?Q?DL4FpyZe/Lbth3BenDUPj/ULafp98M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm5JOWpiNS9OYkMxK3BDZkxVY1dPYWtTQVcvTmJyRURtcVNBZTR6N1JsUVhz?=
 =?utf-8?B?ZzIrbGlxdmM4STc5VHpkK2lxL0J4bUlpTkMxTDBUOFhSL3RCVmJNS2dNYnVT?=
 =?utf-8?B?cEpYd1lXM3hDZllRUWM3N2ZNR3JNVDI3RlZCM1ZSVTB5dDRVN1k4cFNuUXdp?=
 =?utf-8?B?VC9CSGdHSkE4TkM3Uzd4RDBNazdobTFUckIyRGhoQStGUzgrbU5tRHdXYU01?=
 =?utf-8?B?OFdNUlcvWGdjTkZKbjJRNXNEVFJ6dTMxMnJxd09GeE1KM3ErekFiUCtxMFZu?=
 =?utf-8?B?aW9lVENpUThYRmltSnpaU2xsY2Y2QzBreWVtajJBdmp1bjA2am92YStvM0k2?=
 =?utf-8?B?YUxYeENFaHdDbG1WVFk3ZGZhWURiU1V4R3lneU03MXRrTmFBdUZwQVFHL3BB?=
 =?utf-8?B?YkxHckxTbUNzZUNnNURWVlAwRy81blRTRmdKdmtrYnJJVG5vZzVIdGhLMG9U?=
 =?utf-8?B?cGdFUlJSTkxpeklieWU5azc3WExnYzlvaDZnRHFZU3MwWUplNVliWlkyV0Q3?=
 =?utf-8?B?ZlVYRDZwZ1N0eDY2eTcreXYxZTQxNmZQSnVyY01JVDRxNXg0V1psN0ZjaHlN?=
 =?utf-8?B?REtZL3pJVDc4c1lBbkU2L1JUYmdseURtUG1hWkE1RW5kc0dmRlc2T1QwYnV6?=
 =?utf-8?B?aG0zVUZ2aUUvZFZ5NFdZZElyNzZsWmFzOXR4bkp2Qnc5MERJNHhwNE5RMjdw?=
 =?utf-8?B?azRLYkFoSFRVNWZSaXNOQnkrRlJtbXlvWGJHM29OT1VPZkU5VjlzZ0xQTWFE?=
 =?utf-8?B?OWdBMUJwRWU0UXY1MkwyZVlyQkE5MjdSWlFkSlBwcFZlZ2Y1dVlIai82aUtV?=
 =?utf-8?B?dXRodTBBZTZHV2VqZ2Z1MnJ0MlNGSUMrc3FRQ1VNYzR6ZVgwYTVkTVB5WCtV?=
 =?utf-8?B?S241ZVVrNkN0RlBsVFI3ajk2bzB3blNDUHpQc0hRTWVsdzhnRjlmb0V2aUty?=
 =?utf-8?B?UHhBTlpEQk0xVTJqbVpMNWRoQ0NydkhwTGFGOVVCb1dUMzBDd2JHNU5UdHFK?=
 =?utf-8?B?bDhtWGxZMXZJS3N1R0hIc3VncVU4Ujh4emRPeWczZG9JNkp3bWx6VGJRaWw1?=
 =?utf-8?B?U0JIbXJhTnliZWlBWnZsdFdkRHpqVFFzMmx5WnlUM25OR1VyZnU1SmFrMWtL?=
 =?utf-8?B?aXRCcTVNQUk0UTlkaUZ1VUREUUNEVmx1aGw3VDg1NTZIT2ZkVmJSVTJpTVYy?=
 =?utf-8?B?dU1mTXQvejZJcEswUXdGVmkzb0xRT2lQRTJ4UE91Mlc0NjE3RHFVUitPd0pw?=
 =?utf-8?B?NnJPMEdieWdRSHZ3cDhDWXpXc016TDNPS0F3ZEkrelVLY3lkQmdRU2FqRVlr?=
 =?utf-8?B?YXdkUnprUExDU1pUWTY1YTZrVjZES01IMmlxMHFhK3pDNlRObHRVb2UyWTBT?=
 =?utf-8?B?dk5ZMlI2c3Nsd3ZNU1FkcWhPWFB3QnJHdzdKWkE5TlhPZkswTThhOTNTWndy?=
 =?utf-8?B?Uk1vaG4vUStFMEFNblZCZDUvNXdxbzlhWnJJSnpYR0UxZTFXUHJmZlBwT3ll?=
 =?utf-8?B?ZlZZVXIzMnlMY0Y3Sk1ZVHBmVGhIV2VCbVY2ZVA0djJxRjloRmVTS0hBb1Bz?=
 =?utf-8?B?TjQ2YlB6YjYyeGRMcDByVFlhWFpzYXdOVURzQTJ1KysyVlg0OHEzVkFOM0hI?=
 =?utf-8?B?SkZuWGFkRi8vc1FydDE1cmRaV0llNG4zaENRd2NGeHJUejFxZjMxZjBremE2?=
 =?utf-8?B?SGtKU2dOK1hOcUJFUnZLZ3ZKQUxwMGtJSHJZWTlDeDROS0FBTmZJbnlXbjZy?=
 =?utf-8?B?UGkyNDFhYi9VTkgwSU1qY2NhendVZlo1dTNCUTVHcHlFNnRTNGFwdEl1Nlhs?=
 =?utf-8?B?OUZTQVBTOVhGVk00V2dhQXdQcm5zTGtueVZmT3RqYjR0eWpjRXk1bTVUdlBl?=
 =?utf-8?B?TGlzam1IL2p2dFVpM2hLRFExZGsyVW5BSWl1WWtNMy9GTGhwK1k4V2tZL0N4?=
 =?utf-8?B?b2Z6L3kyWUtPeGNVUVFwcEd0c3RWZjZFRm1OeHB2b1hTemFXNlV0OWdLb2ti?=
 =?utf-8?B?M21mYXlqcU4rWGlUTGlMa1p3bHdpSDd4UVNDeEN6TnE1anpsZFU5TTBTYnlu?=
 =?utf-8?B?UnJZWm04L2RRZldtWjB3L0Mya280S1lXcnIrdUlCTUNXaDBjUHMzNGd1cG5k?=
 =?utf-8?Q?XAlU8vPyDgfl+03jrXdTgWKgc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A62BFFEC14E004FBB50DD27CA6E6C4A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364379fd-da44-4cfa-f826-08dd89bef090
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 21:18:52.9008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gESvrNUmOEn92y1B0+mWk5aGmFM0Ll5XUX9VX+2X4ZZHOW8ZXe2Rf6gn05doVPikE2gDKc3C3uhOem35lVvTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607
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

T24gRnJpLCAyMDI1LTA1LTAyIGF0IDEzOjU2ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
T24gV2VkLCAzMCBBcHIgMjAyNSBhdCAwOTo0OSwgQmVuIFNrZWdncyA8YnNrZWdnc0BudmlkaWEu
Y29tPiB3cm90ZToNCj4gPiANCj4gPiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9y
IGJvb3RpbmcgR1NQLVJNIGZpcm13YXJlIHZlcnNpb24NCj4gPiA1NzAuMTQ0LCBhbmQgYWRkcyBz
dXBwb3J0IGZvciBHSDEwMCwgR0IxMHgsIGFuZCBHQjIweCBHUFVzLg0KPiA+IA0KPiA+IEEgdHJl
ZSBjb250YWluaW5nIHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJsZSBoZXJlWzFdLCBhbmQgYSB0ZW1w
b3JhcnkNCj4gPiBsaW51eC1maXJtd2FyZSB0cmVlIGhlcmVbMl0uwqAgVGltdXIgd2lsbCBzZW5k
IGFuIG9mZmljaWFsIHBhdGNoIHRvDQo+ID4gdGhlIGxpbnV4LWZpcm13YXJlIHRyZWUgb25jZSB0
aGlzIHNlcmllcyBpcyBjbG9zZXIgdG8gYmVpbmcgbWVyZ2VkLg0KDQpGWUk6DQoNCmh0dHBzOi8v
Z2l0aHViLmNvbS9OVklESUEvbGludXgtZmlybXdhcmUvY29tbWl0cy9udmlkaWEtc3RhZ2luZy8N
Cg0KPiBJJ3ZlIGR1ZyB0aHJvdWdoIHRoaXMgYW5kIGJlZW4gcnVubmluZyBpbiBvbi9vZmYgb3Zl
ciB0aGUgcGFzdCBmZXcgd2Vla3MsDQo+IA0KPiBPdmVyYWxsIEkgZG9uJ3QgdGhpbmsgdGhpcyBt
YWtlcyB0aGluZ3MgbXVjaCB3b3JzZSwgaWYgd2UgaGFkIHRvIGtlZXANCj4gYWRkaW5nIGZ3cyBJ
IHN1c3BlY3QgdGhpcyBtaWdodCBnZXQgcGFpbmZ1bC4NCg0KQWdyZWVkLCBidXQgd2UgbmVlZCBy
NTcwIGluIG9yZGVyIHRvIHN1cHBvcnQgSG9wcGVyIGFuZCBCbGFja3dlbGwuICByNTM1IGp1c3Qg
ZG9lc24ndCBzdXBwb3J0IHRob3NlDQpHUFVzLg0KDQpUaGUgZ29vZCBuZXdzIGlzIHRoYXQgTm91
dmVhdSBleHRlbmRzIHN1cHBvcnQgdG8gYWxsIEdQVXMgd2l0aCByNTcwLCBzbyBkaXN0cm9zIGNh
biByZXBsYWNlDQpyNTM1IHdpdGggcjU3MCBjb21wbGV0ZWx5WzFdLiAgSW4gYWRkaXRpb24sIE5v
dmEtQ29yZSB3aWxsIGFsc28gdXNlIHI1NzAsIHNvIHdlIHdvbid0IG5lZWQgdG8NCnN1cHBvcnQg
YSBuZXdlciBmaXJtd2FyZSB2ZXJzaW9uIHVudGlsIHdoYXRldmVyIEdQVSBjb21lcyBhZnRlciBC
bGFja3dlbGwuDQoNCg0KWzFdIEFwcGFyZW50bHkgdGhlcmUncyBhIHNtYWxsIFR1cmluZyBidWcg
d2l0aCByNTcwLCBhbmQgaWYgdGhhdCBjYW4ndCBnZXQgZml4ZWQgaW4gdGltZSwgdGhlbg0KVHVy
aW5nIG1heSBuZWVkIHRvIHN0YXkgb24gcjUzNS4NCg==
