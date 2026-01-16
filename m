Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F197AD2AB08
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 04:23:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E203E10E7DB;
	Fri, 16 Jan 2026 03:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="df1wxy7F";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 51AB744CAB;
	Fri, 16 Jan 2026 03:15:22 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768533322;
 b=jo0m+eMEQe6XKweYmYD2Oaz3/6ExErcFNeNUl9MLGJLIV6veOGidFOzJC5aBe2G0xaALo
 a6ZUQHsITVRp1ttvldXpRmrOGrVeih2onGHzjFQU0nf6Bf45wTQ9Q49AykX36KBwgoMj6Ti
 n5LLWBu19/XvR0BrXuv+LwS951SqzN1kye8XtNDacoPf8aUG8rEY7Pakrf5E8tJCh4Dq8cI
 c2gR2T+tuNx8qEWstiEzdfMJ0Kimw48R413oYYfx9Q51HytECdqKdC6gOPOH/ToZ8sgA9sq
 4dHxlypQlMiIowjkbkqAKVA75sOhfv2e7E+XE2capVcxsx7mvHDNplpZpoRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768533322; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bdrA2CBIzigVscmBptHFjB6d9xvpUtwD/bz+PikVOlw=;
 b=DbV/Abzpr1X3Cs83cMsNst5nkg3okRB7Zgf27vF6RqipooZxCIFtZlU10o1tB+mAVHOHx
 9xJ2HnbYmAI3Eq6E+ogcz9FrQLWHZmn85zO94SA+oVRf4yWTdP6w2zGC+x3giXMSLJq2h17
 xxV5kzmRMH48BpxhfuO951IxjYlrOmI7N/09WWS/oz+OAT/RyU2UIwJ3RghlSUg9TsLZAXC
 ka+yYrl9uOaPgruBWy8LLnMh0VVD8QkZV/mJVjvUsTJHDlX8PhOhZBQkEQ4s6JFijjQmxWw
 kH+9hF1ytig5MQvcLJ+wo4ow5BKHkus01QoE/wrHXmDx55TmX5v/NLD2iv2g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 21B8540744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 03:15:19 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013026.outbound.protection.outlook.com
 [40.93.196.26])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9ED10E02C
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 03:23:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBvsB4vuQIlw8Ql0fRVN53GlF9wLxqvrK9jXtiHZPNoTCbgb8rpwMElkq7ML1wRblxETTsxunM2oWJCtJrIuFXEY1DffHwQw/pD7zvU4yWZCa7SpFJxlv0oCaioYTqOKJYpsfStKIjcONtgCAgDnB49modxMs5lfexk+C6f9GgQO6T0DbFVfnUHZ8LR8sBKfADyI4qFl4Tw3gQPxRuIdaYfR7l/7ZZ5xsZXqmY+L35K4sp8sc7DRTV4vIC5veszAbyWUxl92T1r8u8fTvzdm/ljOSuvJPEs56kiVU/fiNhYiEmm/g2XV84yKFkZP40HRfaACNFp/WB8JI4LghP7i6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdrA2CBIzigVscmBptHFjB6d9xvpUtwD/bz+PikVOlw=;
 b=rSEKnqAk0Mu73PIWQsByUS1F/9epj6/IlmvpgqvaH0bDHUp5ul+zNL5XzaJIjD+E9F7DQYwkcZCix2OoS1JI7fNjUG0EW3qhuOELoNmhF/QIuY7RZdxtrwXgJSdNbshztsT2yQd6lLg0GqcUjrKQeaVsAqnMiHPa3Aiys3wgEDnmqAfc8oettigL+AI5b4BGi/EuaK/2sA0pNngVz4UGub3DpUq/UFgIJlWFHXiTSLFGHMIMkTcGRio4MsSDIH/0SWgChmdCFZia2D+6lZJyT6xvgk5MawA7IDblXtgcNPxAPQ8n2xOP4oI2roMj35teFSoJLGOuTHMhZPLMODXmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdrA2CBIzigVscmBptHFjB6d9xvpUtwD/bz+PikVOlw=;
 b=df1wxy7FI92TO0/Iw90l9BNzKIO8jRSuxQ3AnLJIHbOJC0bW+97r/oHp5rFXG8dv67KBEJ26DHcF+NRVPlhUBx/dDVb2aiaHmGved/r8suOpjjm+HOIfpR2zFTYig7f+hK99XVJ9WfRihPp9iSJxnCD8Ab1ftYccJWiHIFCpm7w7KgeUZrXhG9hZU3SzNAN2Qzm4KSl1R/HfIjxkSP83Kkdsow6PNQHMy8ZyWGwot8AMVE4ihET1Kz3BbVmucc+hQORWvSvPZvVCSbTYvZYkXC1Ua2z779V+vgAvDNNLYSeJpAYC4fGVshogYx2/c6VFLr29CiZEc/wGM/VR7szPzA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 03:23:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 03:23:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 12:23:45 +0900
Message-Id: <DFPOX3BJZ09C.1H3K67HGP3HLP@nvidia.com>
Subject: Re: [PATCH v6 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-10-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-10-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9ceaa5-9f53-4636-d072-08de54aea9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vi9Sbmc5SmNyYzBsSlA0NzZiSEJVUHFJcnNVOVVCM2xRdVpPTVBZUVgyZ3d1?=
 =?utf-8?B?S1JkUjVlWXNkaVRYSkJPcjBSUC9BOERIcjM5RUQydnR5QmNrYnl5RWpKK2Ex?=
 =?utf-8?B?N3BCbWtTaGFLdlVrS1NUc3hNc3hWdExvbnNLdFpKVjl5dE9uYm9HL09hN2hU?=
 =?utf-8?B?WEJlQ0pBTGN4Y3l5TkJHQnUveGl5VEVXMWNBSkpNcHNSYlNYb1BOSEwxZ2lz?=
 =?utf-8?B?VVBrS2JsL1hsNnpyRk9uNGJpTTB2RitVQjNCaXF6eFpaR3ZabmkzMmgveWhQ?=
 =?utf-8?B?ZHJTSDRnTUtqSVJrYU9ucGwwK3RWZ2prTk9xajBsZkJiUnZFQmx3ditTOUph?=
 =?utf-8?B?OWR2Y2NESUc4TWEyUWNPWGx5clFYMFRyLzU0aXRUaTZnWDlFNms0RjJjbXpt?=
 =?utf-8?B?VXlNdENoNFl0R3V6Vlh6NlFKTGhsL2pRMVptUXBnajNCQUdoVUx5RDdvRTBD?=
 =?utf-8?B?LytXYVNGQVR3Y21vbTJCRU8yZG9jT0w5aUZuVUNUL1dpSUJBdUNGSnNFZ3lw?=
 =?utf-8?B?dFFJZFo0SHFYMGlNZzVJaU5saXU3RzlQUVY4VkNMTlM4ZVA4TjlOWFNxVHhh?=
 =?utf-8?B?N1QvUE5HbFExVWlKa3VhYzZVZHVTZUlKOW9sQ3VCazM4cmlVYW4yYnZ5djZL?=
 =?utf-8?B?UGc3WDMrc3RBR29zN3lES2orQjMvSWV1a2Z5WlNzb3IrU0lWdE1aeFdNTm1l?=
 =?utf-8?B?SkFTKzJvdlIvUUpuVkFpR0xYSlZvT1A0K3JLUm1YaXIrWVQyeTQ4Sk1rRktv?=
 =?utf-8?B?bjhxUk9kcXFhQ05qdUxoRm4vcmVsV1pPd25UUHJhMzZUMjZ1YklnMHlEeHd3?=
 =?utf-8?B?azJwZFVkR2FuZ2xIb2NBZFBDam1iZ0ZaRmtaTUl2SnViMnZFakFiSFVoeFJ4?=
 =?utf-8?B?a2o4VnV0LytURmVEdy9lUlJkZnNCSHdLWFpLRkcxUjhkM3dvZS9jd2xPWFU0?=
 =?utf-8?B?MEV1ZnNEZjB6eloycCtVYlgrQkl6M0d4dGxrNUZtODhjWHZ1ek5XKy9MNmtC?=
 =?utf-8?B?aGc3Tjd2VS81T2xZNW1VeVpZSWQwQjZraEpWL1hwZktDeklaZnR2M3dPT1Vm?=
 =?utf-8?B?Z2dxRDBJUFBUMEFPZVZyeSthMWtzbmxXd05JQTZTVjY3N3pZdjN1TUR5czdH?=
 =?utf-8?B?VCtGdlFUc2JiVTFDVlJ3TDR1UkIzS0ptWUEyci81Tkl2R1pLSGtLMlZUbTFr?=
 =?utf-8?B?Zi9waHpLZkhGU0dHQWJjWXZhRlpiMnhUcWJlbExzUkdrSm1wL3ZZOVhDc2Ry?=
 =?utf-8?B?YXVTTXFkNktxSVVxRmRiYllmSDNPVEQxUHRyTXk0SUNWQ05tcTQ2MnRrSTkw?=
 =?utf-8?B?ZU9IcVpWdGtHYVFLejYweXFXL294UXYvMTBmdGFNdkVpWFJqd1FQeHVSeUg3?=
 =?utf-8?B?b21VcnJQcitjWEF3VXlKa2ZORW1PTHlhZnJZNFFHSHVKVG9BczBFamdNczc4?=
 =?utf-8?B?L3hPU01HMTdjZGIvUkw1d1drYTBYdFNyUTRuWEZSSUNORDJUcENXMWdsdjdt?=
 =?utf-8?B?QnRkdldHOTc3ZjRHbUZUV056Ymx6LzYvTXJQaTlybFVPQkNxelBtNVZDWkwy?=
 =?utf-8?B?dm5wUFo1YlJya0hXbHVWaDN2N2FnenV1R1NueVV1RGFWUFZKTlNDYlBLcjhF?=
 =?utf-8?B?Yk5Ya3pkeFdXY2NhdmIvUlZiY3FlVm9NaUFqOE9WdlkwMmxGbEpvdmdRb1Vy?=
 =?utf-8?B?djlwM2lMV0pQTmYxbDg3aERXWXJSUXVWWkhEdmFDc2E2d2V2MUFoM2JjTVF3?=
 =?utf-8?B?TTUxMmFCUXlTallyRXE1b3Ixa21jNWVGYU9oM0JMMWYzVkFiMjRkRzc0U016?=
 =?utf-8?B?SHh1cXNIVkFoNEc4UkJNb3Y4Y1FGcXF2OCs3RG80eTN1bVdMZmZHR3lrOWE2?=
 =?utf-8?B?QU4yYW5BU2ZLd2NFWjBZZm1BcnhQOEVlNFpLSmZxdENZQ21SNTZJY000d0pJ?=
 =?utf-8?B?bFhSbzI5bXYrczJzTmdNVUlYRG1VUVZPU2M0YXFIa0ZYeHdoSVZKeTNnNTla?=
 =?utf-8?B?TkREMk9vWmhjV2t0V2hiazVLTWFLTVEvNTl0YVlvejlNNmdtTDRja25wQ092?=
 =?utf-8?B?cm1QbCs2WnBSRDBaek9JLzcyeE83OFdPZE5GNUdvQzhWS3ZkTDFvaWJuSFk3?=
 =?utf-8?Q?82mw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q09Zc0p1OWViV0lacEZ3dDYxU1VYVGJJQkVGWkVBRG4vMk9rY285UmJSNm45?=
 =?utf-8?B?MFdtSjliM2dIbVVLOWJtYkt2bWhZemNlYzRLSWNmQnJyTDRsUlA5ZENLREdx?=
 =?utf-8?B?bUI2MU5hSGxPaFh0akpZYkozNWJOZHlmOG9UcFViTzlramJqZHFqVzcxVnd6?=
 =?utf-8?B?VDRoRlZ5V09HQ3FYM2I3V3hwdGd6RXBES29INkE1ODFaU0VZYTcwQlQrRHYx?=
 =?utf-8?B?NmhMRjQ2TmtJZjlpcENCMkdLNkY2OVlDSUEvREFLc1AvS3VHQ283NkE2WVM0?=
 =?utf-8?B?Y3l2dDY5Y2lhN3NYUnZuYmhvUDFUTjNiT3pmdTRxVDVJNnp4QnlSYzl0aHk4?=
 =?utf-8?B?QlNTN0lwQmFxWCs3ZnpkaDRsZnNoMFVkMFFaaFluQWMzam5RaVVpMmxoLzEy?=
 =?utf-8?B?WmlUTEk3RFMxNE9tWnA1a0wrOUxTbUhIWlUxaC83WnozcFFMeTdBYUEvRGZ2?=
 =?utf-8?B?aGV3bjJMcWhxbUhKanpUTzZjdS9FQUR4aUllWk1kcHhvL2FqMVJDUjlFS1RJ?=
 =?utf-8?B?UTNxSnh4RmZqUDVXc280YnFtRkZTWHUzRDFyZDhjMHpUQzZiblJaRG1EV2xK?=
 =?utf-8?B?Z0RlZGV2bzFwd2NtSHRpeFZsSGRuQWtMM0llVFc4YWFDOXBvVG5uRTJYanZx?=
 =?utf-8?B?TE9qS2Y0VFNGQWNFbnU5a1RVRCtWLzQ0ZXdZNUE5czg1M045d0xKQ0hOY3Zq?=
 =?utf-8?B?NlEzQld0WEd4Zk9IUnJuUFhoR041d0JwRkRQa3BubFhvbjlsanBtUElhWmVY?=
 =?utf-8?B?K0tWUkI5Tk0vNHN1T0I4RG0rZTdCeTBoTHNBZnQ2MEwwbVJycnhPcVFCUEVB?=
 =?utf-8?B?d3JxZGtWMnptUXRWZzZpNFlpMUxWSDlLc21Pb1lNRmVRdXluU3haL3BjR1RH?=
 =?utf-8?B?UTBHOWJmcHk1V0Jta1R1RnpkRk1WN0ZTZldiV284N09KTmx1Q1NZOHhoKzBD?=
 =?utf-8?B?b1YxVWtMRnQyazZyY2JBV21JaENBY0YvVno3YkZwYjZReHB4TU1pbWZDYnhS?=
 =?utf-8?B?WmxUTzEyY08rc3hKb3lMVDcvWnovOFpBOU1uRGFJeHdTMkozczFCK3FOMEc2?=
 =?utf-8?B?ejhpWThpK200bkh2dEhOSjladnFybGc0V2VKbTNZeldneHp0RHpNZWkxSkJh?=
 =?utf-8?B?WmgvdUY5V2JTV245Q2RwTFNtV0JPQ2lIdHNXS1dLeTlrcTVnU2xXcjJNRHZB?=
 =?utf-8?B?VVhCcFYwbkxBOWpqVUM3dFQyOEl6OVdkOExuUUJ0ZUdQdVlDTFpIMHQzY0Z5?=
 =?utf-8?B?NTJqYmZOL25RYm9oaytuL2pEelhhSU1NNTZMdlliMWRUQ1p0akJGK0I5K01G?=
 =?utf-8?B?eTFBVFdJenQ0RGl2WFd3RzB0a0M3VW5Wb0dkaWJ4SHhtTW1XRFhxU2hYYmJU?=
 =?utf-8?B?NnJwalVvdVlNM0Q4aGtPVHBMNVFOYzlLZ0JRMW5WOG5laTBYdEkzd0puWm8x?=
 =?utf-8?B?amNkNTY2cnplMkdlcEhEMmdqSmxkNFB3SFk5WENVNFI4T2dERytKOFVCMEth?=
 =?utf-8?B?ejBDOFJoM3dsZkJBamt1ZG01U0VxOHFJdVFDMTBMYTZwNWV2ck1EaGNDdHBE?=
 =?utf-8?B?a0RqMkV6MWdpNWF1d2VpWXRBaHFEb3hCWjJFRjhpMzE1VzltdTU4ZkNTU2s5?=
 =?utf-8?B?eGFSWENiYm9EUjg2M1BHMXllalVwejNjN2dRTDZqMWUremRGUFlITi9Sak0y?=
 =?utf-8?B?OFNuNk1TczJWNEh1SGxZREIwQjZYajlzWGQzNzFiVFdCbnRlbzQ2S2NzZTlx?=
 =?utf-8?B?VWRRTDY3UldQSGVkZnovOTRQenAyZFNZM3RIV2YvMmFQOHNuN3U5REMwbGEz?=
 =?utf-8?B?MkJRTG96NzFiOUVlWVA2MUFScll0K3Q0ZktKMDU1YmZuSVdEZXlIMFRjZkdq?=
 =?utf-8?B?d3NoaGtwais5aEVJWldhY0VJaEFwK09pQmZ4MEpaN0ZEeGdGc3o5QWZYWkFO?=
 =?utf-8?B?K2d0aTBpMm1ra1pTQ2ZrQzdDenM1d0h5czVXdlRoZitPNCtDN1V2RkROcEtz?=
 =?utf-8?B?MlVGZDhrbnNPMm1wMmxkWCtwUFdCYlhiOTE3bTJ3TGU4WXRQR3lhdHpKMTho?=
 =?utf-8?B?MWV3VWhEYUVkSnNnczRrNVl0KzFieVFKeGpDcHFXZTFWeERlTjl4cGdWZyti?=
 =?utf-8?B?OEtJczBRRWR6Y0J5TWJMWVkrVStKTnBtVkJoNzJlNkptTFZXTE45RlB2M2Va?=
 =?utf-8?B?RzFRV2RzcTlLRlF4YjZyTjVTZC9iTm8xOVJLV2kyOVQ5Ly92WndjT1hrTkw5?=
 =?utf-8?B?Zm5TNzAraXVLcUdxUERCK050ZVRja1RCaU5tR2dxZ0pMMFZjakdvQ2IyNS9G?=
 =?utf-8?B?Mk92L3NLa3FGVWJEaCtvaEhTME9jTmZ2bHNwSFZIVUF4NEZTa2p6U3hXUmFL?=
 =?utf-8?Q?DWcagbLQbSp4PyrJ9OLfU3WlTU7knpkUQCxjW1iMJ1HjF?=
X-MS-Exchange-AntiSpam-MessageData-1: DK0h9HYDlVIv9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a9ceaa5-9f53-4636-d072-08de54aea9e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:23:48.5926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hLc0IfkOUwREM18g1OurZF+pX9/HA9qgBJ3Xhz6FlFpmZArwgwr4bz2fnXtr+m8BVK1gbn7Q262pH6z7FhWsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337
Message-ID-Hash: TYUFHOH4DZV4G24EWCIIDTM42UQFO35I
X-Message-ID-Hash: TYUFHOH4DZV4G24EWCIIDTM42UQFO35I
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TYUFHOH4DZV4G24EWCIIDTM42UQFO35I/>
Archived-At: 
 <https://lore.freedesktop.org/DFPOX3BJZ09C.1H3K67HGP3HLP@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 15, 2026 at 4:29 AM JST, Timur Tabi wrote:
> The FRTS firmware in Turing and GA100 VBIOS has an older header
> format (v2 instead of v3).  To support both v2 and v3 at runtime,
> add the FalconUCodeDescV2 struct, and update code that references
> the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
> encapsulates both.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs       | 149 +++++++++++++++++++++++-
>  drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++++----
>  drivers/gpu/nova-core/vbios.rs          |  75 +++++++-----
>  3 files changed, 237 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 2d2008b33fb4..9f0ad02fbe22 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -4,6 +4,7 @@
>  //! to be loaded into a given execution unit.
> =20
>  use core::marker::PhantomData;
> +use core::ops::Deref;
> =20
>  use kernel::{
>      device,
> @@ -43,6 +44,46 @@ fn request_firmware(
>          .and_then(|path| firmware::Firmware::request(&path, dev))
>  }
> =20
> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct FalconUCodeDescV2 {
> +    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in Op=
enRM.
> +    hdr: u32,
> +    /// Stored size of the ucode after the header, compressed or uncompr=
essed
> +    stored_size: u32,
> +    /// Uncompressed size of the ucode.  If store_size =3D=3D uncompress=
ed_size, then the ucode
> +    /// is not compressed.
> +    pub(crate) uncompressed_size: u32,
> +    /// Code entry point
> +    pub(crate) virtual_entry: u32,
> +    /// Offset after the code segment at which the Application Interface=
 Table headers are located.
> +    pub(crate) interface_offset: u32,
> +    /// Base address at which to load the code segment into 'IMEM'.
> +    pub(crate) imem_phys_base: u32,
> +    /// Size in bytes of the code to copy into 'IMEM'.
> +    pub(crate) imem_load_size: u32,
> +    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should sta=
rt.
> +    pub(crate) imem_virt_base: u32,
> +    /// Virtual address of secure IMEM segment.
> +    pub(crate) imem_sec_base: u32,
> +    /// Size of secure IMEM segment.
> +    pub(crate) imem_sec_size: u32,
> +    /// Offset into stored (uncompressed) image at which DMEM begins.
> +    pub(crate) dmem_offset: u32,
> +    /// Base address at which to load the data segment into 'DMEM'.
> +    pub(crate) dmem_phys_base: u32,
> +    /// Size in bytes of the data to copy into 'DMEM'.
> +    pub(crate) dmem_load_size: u32,
> +    /// "Alternate" Size of data to load into IMEM.
> +    pub(crate) alt_imem_load_size: u32,
> +    /// "Alternate" Size of data to load into DMEM.
> +    pub(crate) alt_dmem_load_size: u32,
> +}
> +
> +// SAFETY: all bit patterns are valid for this type, and it doesn't use =
interior mutability.
> +unsafe impl FromBytes for FalconUCodeDescV2 {}
> +
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> @@ -76,13 +117,115 @@ pub(crate) struct FalconUCodeDescV3 {
>      _reserved: u16,
>  }
> =20
> -impl FalconUCodeDescV3 {
> +// SAFETY: all bit patterns are valid for this type, and it doesn't use
> +// interior mutability.
> +unsafe impl FromBytes for FalconUCodeDescV3 {}
> +
> +/// Enum wrapping the different versions of Falcon microcode descriptors=
.
> +///
> +/// This allows handling both V2 and V3 descriptor formats through a
> +/// unified type, providing version-agnostic access to firmware metadata
> +/// via the [`FalconUCodeDescriptor`] trait.
> +#[derive(Debug, Clone)]
> +pub(crate) enum FalconUCodeDesc {
> +    V2(FalconUCodeDescV2),
> +    V3(FalconUCodeDescV3),
> +}
> +
> +impl Deref for FalconUCodeDesc {
> +    type Target =3D dyn FalconUCodeDescriptor;
> +
> +    fn deref(&self) -> &Self::Target {
> +        match self {
> +            FalconUCodeDesc::V2(v2) =3D> v2,
> +            FalconUCodeDesc::V3(v3) =3D> v3,
> +        }
> +    }
> +}
> +
> +/// Trait providing a common interface for accessing Falcon microcode de=
scriptor fields.
> +///
> +/// This trait abstracts over the different descriptor versions ([`Falco=
nUCodeDescV2`] and
> +/// [`FalconUCodeDescV3`]), allowing code to work with firmware metadata=
 without needing to
> +/// know the specific descriptor version. Fields not present return zero=
.
> +pub(crate) trait FalconUCodeDescriptor {
> +    fn hdr(&self) -> u32;
> +    fn imem_load_size(&self) -> u32;
> +    fn interface_offset(&self) -> u32;
> +    fn dmem_load_size(&self) -> u32;
> +    fn pkc_data_offset(&self) -> u32;
> +    fn engine_id_mask(&self) -> u16;
> +    fn ucode_id(&self) -> u8;
> +    fn signature_count(&self) -> u8;
> +    fn signature_versions(&self) -> u16;
> +
>      /// Returns the size in bytes of the header.
> -    pub(crate) fn size(&self) -> usize {
> +    fn size(&self) -> usize {
> +        let hdr =3D self.hdr();
> +
>          const HDR_SIZE_SHIFT: u32 =3D 16;
>          const HDR_SIZE_MASK: u32 =3D 0xffff0000;
> +        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +    }
> +}
> +
> +impl FalconUCodeDescriptor for FalconUCodeDescV2 {
> +    fn hdr(&self) -> u32 {
> +        self.hdr
> +    }
> +    fn imem_load_size(&self) -> u32 {
> +        self.imem_load_size
> +    }
> +    fn interface_offset(&self) -> u32 {
> +        self.interface_offset
> +    }
> +    fn dmem_load_size(&self) -> u32 {
> +        self.dmem_load_size
> +    }
> +    fn pkc_data_offset(&self) -> u32 {
> +        0
> +    }
> +    fn engine_id_mask(&self) -> u16 {
> +        0
> +    }
> +    fn ucode_id(&self) -> u8 {
> +        0
> +    }
> +    fn signature_count(&self) -> u8 {
> +        0
> +    }
> +    fn signature_versions(&self) -> u16 {
> +        0
> +    }
> +}
> =20
> -        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +impl FalconUCodeDescriptor for FalconUCodeDescV3 {
> +    fn hdr(&self) -> u32 {
> +        self.hdr
> +    }
> +    fn imem_load_size(&self) -> u32 {
> +        self.imem_load_size
> +    }
> +    fn interface_offset(&self) -> u32 {
> +        self.interface_offset
> +    }
> +    fn dmem_load_size(&self) -> u32 {
> +        self.dmem_load_size
> +    }
> +    fn pkc_data_offset(&self) -> u32 {
> +        self.pkc_data_offset
> +    }
> +    fn engine_id_mask(&self) -> u16 {
> +        self.engine_id_mask
> +    }
> +    fn ucode_id(&self) -> u8 {
> +        self.ucode_id
> +    }
> +    fn signature_count(&self) -> u8 {
> +        self.signature_count
> +    }
> +    fn signature_versions(&self) -> u16 {
> +        self.signature_versions
>      }
>  }
> =20
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index e4009faba6c5..c4fff8b86640 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -40,7 +40,7 @@
>          FalconLoadTarget, //
>      },
>      firmware::{
> -        FalconUCodeDescV3,
> +        FalconUCodeDesc,
>          FirmwareDmaObject,
>          FirmwareSignature,
>          Signed,
> @@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBy=
tes>(
>  /// It is responsible for e.g. carving out the WPR2 region as the first =
step of the GSP bootflow.
>  pub(crate) struct FwsecFirmware {
>      /// Descriptor of the firmware.
> -    desc: FalconUCodeDescV3,
> +    desc: FalconUCodeDesc,
>      /// GPU-accessible DMA object containing the firmware.
>      ucode: FirmwareDmaObject<Self, Signed>,
>  }
> =20
>  impl FalconLoadParams for FwsecFirmware {
>      fn imem_sec_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: 0,
> -            dst_start: self.desc.imem_phys_base,
> -            len: self.desc.imem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) =3D> FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_sec_base,
> +                len: v2.imem_sec_size,
> +            },
> +            FalconUCodeDesc::V3(v3) =3D> FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v3.imem_phys_base,
> +                len: v3.imem_load_size,
> +            },
>          }
>      }
> =20
>      fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> -        // Only used on Turing and GA100, so return None for now
> -        None
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) =3D> Some(FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_phys_base,
> +                len: v2.imem_load_size.checked_sub(v2.imem_sec_size)?,
> +            }),
> +            // Not used on V3 platforms
> +            FalconUCodeDesc::V3(_v3) =3D> None,
> +        }
>      }
> =20
>      fn dmem_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: self.desc.imem_load_size,
> -            dst_start: self.desc.dmem_phys_base,
> -            len: self.desc.dmem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) =3D> FalconLoadTarget {
> +                src_start: v2.dmem_offset,
> +                dst_start: v2.dmem_phys_base,
> +                len: v2.dmem_load_size,
> +            },
> +            FalconUCodeDesc::V3(v3) =3D> FalconLoadTarget {
> +                src_start: v3.imem_load_size,
> +                dst_start: v3.dmem_phys_base,
> +                len: v3.dmem_load_size,
> +            },
>          }
>      }
> =20
>      fn brom_params(&self) -> FalconBromParams {
>          FalconBromParams {
> -            pkc_data_offset: self.desc.pkc_data_offset,
> -            engine_id_mask: self.desc.engine_id_mask,
> -            ucode_id: self.desc.ucode_id,
> +            pkc_data_offset: self.desc.pkc_data_offset(),
> +            engine_id_mask: self.desc.engine_id_mask(),
> +            ucode_id: self.desc.ucode_id(),
>          }
>      }

It looks like John and I have a different opinion on which approach is
the best to handle the v2/v3 headers (a match in each method vs a new
trait and virtual method calls).

TBH I don't really mind which approach we adopt, but I would like us to
stay consistent through the code. This patch adds the trait and
implements `Deref`, but then the chunk above still performs matches.

I did suggest that we add more methods to the trait in v4, but to be
clear here is the doing what I suggested. However if you prefer to drop
the trait and perform a match in every method of `FalconUCodeDesc`,
that's also acceptable to me - in this case the matches you did above
would be consistent with the general approach and can be kept as-is.

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firm=
ware.rs
index 9f0ad02fbe22..68779540aa28 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -16,7 +16,10 @@
=20
 use crate::{
     dma::DmaObject,
-    falcon::FalconFirmware,
+    falcon::{
+        FalconFirmware,
+        FalconLoadTarget, //
+    },
     gpu,
     num::{
         FromSafeCast,
@@ -167,6 +170,10 @@ fn size(&self) -> usize {
         const HDR_SIZE_MASK: u32 =3D 0xffff0000;
         ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
     }
+
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+    fn dmem_load_params(&self) -> FalconLoadTarget;
 }
=20
 impl FalconUCodeDescriptor for FalconUCodeDescV2 {
@@ -197,6 +204,30 @@ fn signature_count(&self) -> u8 {
     fn signature_versions(&self) -> u16 {
         0
     }
+
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.imem_sec_base,
+            len: self.imem_sec_size,
+        }
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        Some(FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.imem_phys_base,
+            len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
+        })
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.dmem_offset,
+            dst_start: self.dmem_phys_base,
+            len: self.dmem_load_size,
+        }
+    }
 }
=20
 impl FalconUCodeDescriptor for FalconUCodeDescV3 {
@@ -227,6 +258,27 @@ fn signature_count(&self) -> u8 {
     fn signature_versions(&self) -> u16 {
         self.signature_versions
     }
+
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.imem_phys_base,
+            len: self.imem_load_size,
+        }
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        // Not used on V3 platforms
+        None
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.imem_load_size,
+            dst_start: self.dmem_phys_base,
+            len: self.dmem_load_size,
+        }
+    }
 }
=20
 /// Trait implemented by types defining the signed state of a firmware.
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-cor=
e/firmware/fwsec.rs
index a5678db8f78c..4efa4711fce1 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -292,45 +292,15 @@ pub(crate) struct FwsecFirmware {
=20
 impl FalconLoadParams for FwsecFirmware {
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        match &self.desc {
-            FalconUCodeDesc::V2(v2) =3D> FalconLoadTarget {
-                src_start: 0,
-                dst_start: v2.imem_sec_base,
-                len: v2.imem_sec_size,
-            },
-            FalconUCodeDesc::V3(v3) =3D> FalconLoadTarget {
-                src_start: 0,
-                dst_start: v3.imem_phys_base,
-                len: v3.imem_load_size,
-            },
-        }
+        self.desc.imem_sec_load_params()
     }
=20
     fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        match &self.desc {
-            FalconUCodeDesc::V2(v2) =3D> Some(FalconLoadTarget {
-                src_start: 0,
-                dst_start: v2.imem_phys_base,
-                len: v2.imem_load_size.checked_sub(v2.imem_sec_size)?,
-            }),
-            // Not used on V3 platforms
-            FalconUCodeDesc::V3(_v3) =3D> None,
-        }
+        self.desc.imem_ns_load_params()
     }
=20
     fn dmem_load_params(&self) -> FalconLoadTarget {
-        match &self.desc {
-            FalconUCodeDesc::V2(v2) =3D> FalconLoadTarget {
-                src_start: v2.dmem_offset,
-                dst_start: v2.dmem_phys_base,
-                len: v2.dmem_load_size,
-            },
-            FalconUCodeDesc::V3(v3) =3D> FalconLoadTarget {
-                src_start: v3.imem_load_size,
-                dst_start: v3.dmem_phys_base,
-                len: v3.dmem_load_size,
-            },
-        }
+        self.desc.dmem_load_params()
     }
=20
     fn brom_params(&self) -> FalconBromParams {

