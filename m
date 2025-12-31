Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6318CEC615
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 18:29:39 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03C8910E2DC;
	Wed, 31 Dec 2025 17:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c3DsijA5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B954644C5B;
	Wed, 31 Dec 2025 17:21:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767201697;
 b=ig0MBy3s4ThCYILXc3gdDS6A/DaYuz5FeBpYIMUbMtOqgwKeASxBBUmAHWnzYuXys3APi
 A7bq5K/Y2rsUQOcM9gWAnAyFeCBzZVXu38IGkUVxCQ579IXT4ibpXeStK94zWuLdioDkYWo
 eHgpyJj2H3bAmOMeqvxxu/y0OkLoEruCBBIaOArNYRr29UUeZKJEZQq/W1l8yqJN89HtpQ8
 fqg4m7iu77TeGdVj2JcFG4XRksKtPEzrE1VPM2JCAPPfvSejDMB2cVrtU0VOhsTVKPJ3Kw1
 8kRzSQKoBxx22ixpz9b11/H3DeCpkzMNmZnTkKq2APUHTcWPr7YRBPWHlv9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767201697; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3swXvV0VrbmQGOwcsGTGG5+t3eBkRG+gdsRGfBZHch4=;
 b=T1s6SeDVZUmgeLDNwFzQ1p8HF9wFp+dO4515JA+xNyPWGmonEh24mce6/9pnWCuG8KZw6
 7HllIBPKr9GaQUDKRXJ8Ax99Ps0Te/3oMU3auYzh0Tp1FGEbUCwYH21+QCE5JXDKmg4g+FC
 UcECUD1G4dnIeVlgQQmjghEDOGXtDsZOSHerZxL+7Mijc+s3ykkXaTPPs9TAUQyIBqkWv1R
 6EuUjMeC2/47QwBvd8Mv7ljjavRLDC3sb7AOw/I3D3PnRyuIJPAWUWfBnTTevSjIUJpfKI2
 zgrZmGT9TMHe/8HtOTmamuMJeRXWMTTC0OFhPkjAQHIIrPnYsYWqhoHoBNIg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5302E44C47
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 17:21:34 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4884910E2D6
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 17:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqpPo+OTEAmjERqx4Vf3sIHrT/kzfpTXV5BSwMB6+e8juqjqJMWAGBxRxSpl1NdCvxAy7zocSGYme7elYCrf2iVuJ65ooasK4fMJ0BDBtZOzXquKdZTpg2Jl9k7nPwQ3EMicGEFY5f8VPcTw7BWqwE2VYXIzUxYbE09kDvfVUm8XYwbOeC49v42Ray18z48wjf5FGHVRbknkpMIj5x9SLcCtsNev4j4XQcORAkLqgy4GgFYgkh84OVwc+I7VAWWJYYfQ1Foj65AWjIehF4BL71nn3tVkzOeblyPpIIB65xjIWn9XtDqFhgsPJ41E+KqdXJi37/wUU6oWjitH6ACEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3swXvV0VrbmQGOwcsGTGG5+t3eBkRG+gdsRGfBZHch4=;
 b=nrDWEuPp3or9DaJCFVbk553nEJwFj+zC9naYk49Uzvl3K8OjKlpJuxQlup2N0Z+EmwaQP9xezEr04RienIFNBu9K7wwNAc1b04Be96LrE0oGiiEuJOH2YdwsiYrmavPkYIsunH7xkV6UfdAJ1cL2eqTksyrZew6Sl8P0usuPocG2qaIEKWqQuXIdBrimLUPYoBh+cR6asUiAALbEJmUXpuh8bJL2S9p6WjFyVb0y/h9FkoF6Y56jaW/i7obisQhMygd2leHy6cSDG2ywQL9fQ5r8YcaV6U0jV3yc775d7czmdCteeCg8AfbSGRo1iDMuXcGr9lkec2GXXwZULyZUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3swXvV0VrbmQGOwcsGTGG5+t3eBkRG+gdsRGfBZHch4=;
 b=c3DsijA5LRU14GM9AZmVxZk3lW1tGFJJEWk+KHIqPVX2gNdpXlLh4KaHlwFE4D+2ErUt9vaUNlRGhV68BULdhaaNcSLyHogfuI7CrR3lDrQdb0kAJHAN6LJR6mnYzE36BOntH4GxGRrNJYd7KHrBWSMG9TXKqZu7za9SCKVPNfR2NWyN7Q0MveHA4MKvrgdB2OJgiIUAMhujjiThW2ySKV0Bz0djS12R+tA4EAEHGRf2ApqjKcpsn3hYkxEbgWK0nVSZqKRftuOoN2ixjdeOPx+t3fPvqQf9cZVh7gUBfL/t6b1MvFEpH99m179End5TrycZf/cDOuBbK07xPHdfmA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 17:29:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 17:29:31 +0000
Message-ID: <e1cecbe1-9171-42f2-9563-2946bc0b7daa@nvidia.com>
Date: Wed, 31 Dec 2025 09:29:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
 <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
 <91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com>
 <b8386ea25078f9cd9012645732ba3ef943677003.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <b8386ea25078f9cd9012645732ba3ef943677003.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae19953-aa0e-4e88-a406-08de48922866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzJVZnBRQVFBQXZHajFqbllGRnpLSkN5R0NLZ081OXcrU0pja1ZiUjdYK2U2?=
 =?utf-8?B?RlB3TDhRWjlrUkJSOEd5b0pmUEYvejhyNHg1MWhzcFYvNTQrNDVHeXhqcUdV?=
 =?utf-8?B?MHZMVHplR28zRGpjVTQvTzZwNEpmYkYvUkRkTGhpUXRkcDVZOVFFMHlkZEVM?=
 =?utf-8?B?ckxoRGhxY0l4UGMyd3FCTTFqT1d3MnFzajA1Rm9ZTHh1VU5EVkZiNHI4bmpS?=
 =?utf-8?B?OUZ0YW1wVkFEYmw0N0ZlQWIzZHVEd2k3N2Zja1B4TFIva3pXODdUZC8yZCs5?=
 =?utf-8?B?dkZkWGtTdUgrUkIrOVREWCsvRDdNOVpieEd3U1p0MkUrRDEwNjQ2WllaZDNQ?=
 =?utf-8?B?UC9US1ZVQzVnMUwxZWh0ZWpkdnRteEFFdjNiUFlkc1pDc3NKQS81ZDNhd3ZT?=
 =?utf-8?B?QVZhVDJBOGxzOS84aWV1czRKTGltRlg5LzdabXBxTVBMYzFTZS9rNmluQTZl?=
 =?utf-8?B?ZEpGTzg3alk3cUtzYTYrVm8yQ3RNdmhDNFF4dUY1VFdKc1dDOXpIMG8zK0Nm?=
 =?utf-8?B?cXU5eEVvZFgyRnhOU280TzlFRXcxYkwwVldFVCsxLzVEdElaejVSdlZSemc4?=
 =?utf-8?B?MzJkSFhwNEYyV3FLWURZRFZHRUI0Vm9PakpWSU4xU0dBcjRPME81NFQ4U0wv?=
 =?utf-8?B?UEh2MkMrUDY3K3MvNXd0RHI0Y1krK2gvOXR1R1paZ3RRNzh4Qk4vc0V0TDNn?=
 =?utf-8?B?bzZZN3h3VUV6a2FYdGdIbFliWjVKQmhObHdrYnpQamk5RzN2Qm0yNUovTEJF?=
 =?utf-8?B?SFJ5Wm9KcmdBZ1UzS0RqS1lKc0FhZHNMYU1PdjlyQnhqcW9pdlBPdGw5c2c1?=
 =?utf-8?B?VFRQL0lxOUluRXpaeHF5UGtWelpCN213RjhYa1NQaUo4aldUOGUrcEswM0E1?=
 =?utf-8?B?WHVwL2pzYjdCQkNyU2FtL2FsWjJidjBiVzJ5Q2xacDRackFCdW5SeEUvNUs2?=
 =?utf-8?B?dU9BZE1VcGorUFpPaXFSTjJnY0hzcEl0QlNqcnByUHp6eW8xQ21PNkZGbEs0?=
 =?utf-8?B?WEN3L1ZVUW93SSticXY4a1g4ZTBnN05YbzN4V2l4cnVpV2l4bDh2eGR2NmYv?=
 =?utf-8?B?Z3JRY1ArZkZhR2NRL0VuYmdUby9uOXoyamNOUXpBajFnMmFwbFByaWxkWEc5?=
 =?utf-8?B?VlBSNDNMOHBLaTRzWjNvM0tJQzF2cTFJTFRLWXhRR28xZFhIQStoWld4WENZ?=
 =?utf-8?B?Y1dwVWsxUE1GWGJoTGZ5NHJCRmRkNHhaallNYXc3K1U0R0lFN0ZObHdiclNt?=
 =?utf-8?B?UGJsRXVhZnJBMldjNjJnWHF4Sjk5aTNyRVVOejdoM25lRUlSTUpkY1M0eDY0?=
 =?utf-8?B?WWZhOEYvNHpnRzdOUmZTMVRQV2hBNjJQa0pxaVo1bms3c1RmYW5CSnBsUlAr?=
 =?utf-8?B?NGlXSjhXY1ZFM0NNYm04emllKzZpbXdJRUhHMmcxQ0dqQ1FDMlRoV05zQ3l5?=
 =?utf-8?B?U0RBQWtCb1JvWWYyc1JNUVM0MVQ2aVZld0xDNUpiVnYyTzFOVllidmNjVDA2?=
 =?utf-8?B?WWtDa2QwU2dDYk5ESEp2SHZIMEFOMWhMclVqUktCNmNaaXpLZDJxUmhGQ2Zr?=
 =?utf-8?B?RjNKRmM2QWh3czJjZnp0NytQZlI3UXRZdEc0RmdTczkvQ1ExK3pjY0Y1aWQz?=
 =?utf-8?B?Vkd5VnZmdmhaTmx5ZlFpWi8zb3NRTGtQbHB1cGxaMmthNi9UNEZGbmJxL1Zn?=
 =?utf-8?B?eE5CQWgwN3dnUWFZMm8vRjNaampnM2VyQldwOVNWZy9zUVFEbWsvRHFSZ0dR?=
 =?utf-8?B?Wk82OTdBZm43WWZUY0Y2bjRqU1pZNmpQOU9pdEtUSFdsVXZaYmRLMlgxejRv?=
 =?utf-8?B?cTUrc2ZsaXQ0VEw5L2JoQ3hrM3ppd2QvbnUrMVVrOWJCYzdhSHczSXVROEQy?=
 =?utf-8?B?dTJVMW9qOU5acG5wTkNKZy91ckdHc2lhcE90YWNYV3djN0ExYXRRbHk4azB0?=
 =?utf-8?B?dmhUVnlxdm1aeTQrZlhXN1BJSlZQZ0k1a1lMblNrZG9rZ0FmTXlXNXkvdkdE?=
 =?utf-8?B?TS9NeC94SU5RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXNNdjlWSzVVV2Y4b2Vta0RZYnFNczVycVlsUXhDdVJZVTZmeWt4TFNsTlYz?=
 =?utf-8?B?ZkovY3Q4Y1JkRTNDK2hjQnF1QVNPcXBCM0VtelBaRnNHdDJUKytLeGNCNmdC?=
 =?utf-8?B?UnNZci9sNmQ5c2Q5U0NRaUVQUHgxaWROZWdoQjNSKzY2blhidUxHY0xUeEk4?=
 =?utf-8?B?Tm1CWlV2dVJYVkphYmc1RUNabDk3MDcybE1iRVFIR1VLM1d4SCtoSkRScGZH?=
 =?utf-8?B?eEtJci9QYVFWU3l0Q2dINlFmcnh0S3VESUtxQVhhQnNCNmxvTkN0a3RPUWp2?=
 =?utf-8?B?ZUFncTBxN1FxTFZEMVk3K2tGM3FFOGNPSE9yVHNYU2dvOHhNMWJ3YW9HLzg0?=
 =?utf-8?B?WmVyV0hYdEVZZFN6TGMzdFkwRmhHbmprNzNLZjUrWTR0am1SY0g0MXhBZStN?=
 =?utf-8?B?Rk5BWjI0V09MbzlwbHdGOW1leGJJOU9iYkNMcVFYRVZnQ2RXWHBVN3ZYRU1n?=
 =?utf-8?B?WkNRU3prRmJBSTJYWjhNSXpkYUc3ejBYb2l2L1MxUmJEUHVKNlV5RWdaUTVH?=
 =?utf-8?B?SlVUaWx2dGg4MW0vT293WExyYjAvQU5hV0xFMnlhQkwwQlhLQ1pzb1JGeEwz?=
 =?utf-8?B?RHBHd3hOaU91Z3A5NnhLdU5hWTBNMHFmK25CZG90SXI3aUNtVWIxVFJNZm85?=
 =?utf-8?B?MDZiZGpiejFoeHhlNUZrSzcrc0h1UHVpQjhzRFJpVGJMTkpObE5udjBVTWFr?=
 =?utf-8?B?cFhwNjJuOStaVlNtNDYzNkNQVktxaWJOWnB4b2s2ZS9ZNDF0QVRRa0RsaFZU?=
 =?utf-8?B?bnRIQ0E3V3N5RGEyY045MmtnOVNkK3lXT21ONXorbzB5THBrSmgyZ3Z5T0Jh?=
 =?utf-8?B?NzlDS2dtRnJ0NW9hQzhKSE5pcjYzdnpaQTlXMDIzbWxkM0twT09vUG94Nll1?=
 =?utf-8?B?VUtmRFVmeUpXd25uQml4MlFURElCTGQ3Y044UHc5REJCNUl2bVIwaytrSUx1?=
 =?utf-8?B?YjJ6NlVTdVhLN05IbFM4US9mZ0VKdDl3RVk3Mlp3RlhZenpQbzRGUUF5R2JJ?=
 =?utf-8?B?U3A3REY5Q1FBOU15clBpN3V6eVJFS1BISDhPeW41NXBYSTY3WDMxVEtMWnpu?=
 =?utf-8?B?MzJCRWorV3FIRFhxVEFIVThabUE0RUxqUmxER2EwZ3RpVmpMdk1mN3NPWUl1?=
 =?utf-8?B?OHpyblR5bVhVYnYzZmdsOWtiKzVOdmxUcEYzNFlxVTh3RkpoNklhNHQvK3o2?=
 =?utf-8?B?TWRMQkV3NUlxcjRDUkljcDdabTZwanhva2ZPZ1EyUEZXcXRMeWhlWlRzYk8z?=
 =?utf-8?B?dy8zVjhkOCtHREtNbllzaFROMjhKeFIvMU9UWkppRWNCUGpDcllZOEFCcjNy?=
 =?utf-8?B?MkRGcHVWcUFTZklMQWFpRjVPV2lXRDdqY0t3NGJJOC9lemlaS2lIMU1iR3hx?=
 =?utf-8?B?bWo4T2hvaVlrc0JnZFNSK3ZSRlJzd3A2Z1V2a050VGMxb1JaaTVmNDZ3TFRG?=
 =?utf-8?B?L0VqdnlrVkk1bGZTQWxIM05EZWpxczdoTGN3WGZLalNpUERBSUx3NkhVZ2Zz?=
 =?utf-8?B?RUlwWkViVE04UUszWHVKZzZJdHlHUWN6cHlabmJsV3Z6NFpHRWVvRk1qdkRw?=
 =?utf-8?B?OWh5VEhELzYxa3VEcUNUNko2d1ZjS21QcTJ1VTZHa1RIV1pBTHVXMGFKZFQz?=
 =?utf-8?B?cDIrMTROeFVwdXFRMCtVTmR4Z2QwaXhJU2pGQnpKbEd4YzhQOHJ5UkZOWER2?=
 =?utf-8?B?aHZ5eGFDbWlEWWJOL24wb0FOK3FiQkQ3anBjcnpkbU1PZ3MrZG5EL2RiMXJL?=
 =?utf-8?B?SHdQSWhNWmhlVCtDZ0N0dkNGQ045UXdiaytkKyszUVpGNzMwYWlSa0VIK3o1?=
 =?utf-8?B?Zll6SkNLRmdIWnl5WkRNYWRaTVBoSWVjbGxsOTZvaGE3OTRhZXJtUFovMUM2?=
 =?utf-8?B?Vy9nb0ZGYXVHUExsNXh5V2FwUjl5N1M4Ynl1MEhFaEViV1M3RkV0VVhtZHFk?=
 =?utf-8?B?VnZpQnhENG4zL0M2KzRodnRvVXZhZHd0SWd2Uy85RFZodXZnM3FsUzR6akFQ?=
 =?utf-8?B?dFR5aFVLVm9WSEErSklXa1h3NkVIMmlCcHpBVlNRQkxhZlR1b09qQ3pvcHRn?=
 =?utf-8?B?elJGYXQ3S1NpY3o3bC9DZ01hOWlybXowdXkwdXR6cG4zYU1NZGQ2NHNtenQv?=
 =?utf-8?B?VUtDd0dLVVg4YmM2RzM0ZFBwWkRIT1N0UnAwbHVSMGlSUGdNLzJzelJmVHVO?=
 =?utf-8?B?ZU1MVnRlQ0xtdk1ZbnhjTkJXOWhIcklqUUs4UEpTVG5FUGFqTU1PbzBDQWxR?=
 =?utf-8?B?M0laU0tZU0FUMXhOSUlBcE5OOTh6Z0gvOUM1ekQ5bVphTFFLemRHOXdoLzlS?=
 =?utf-8?B?S0c0N2NqVHVwRERESExLK0Nxa0JoNXZBcDZ2bW1oQXpCM2NFa0I0dDlzdTNy?=
 =?utf-8?Q?bOEdu5Xj0SIcGNuo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ae19953-aa0e-4e88-a406-08de48922866
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:29:31.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WwZGtgJmgItgndnMmueP5+l5wU+jpUdB5FK5zO3iYSHVG0zg7b3ro4mkliysZxs3tuSwcae7waRR1b8ZvGTtAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206
Message-ID-Hash: QTW5AYFDMJIWMS7REWPX7AO2HH5LY2UQ
X-Message-ID-Hash: QTW5AYFDMJIWMS7REWPX7AO2HH5LY2UQ
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QTW5AYFDMJIWMS7REWPX7AO2HH5LY2UQ/>
Archived-At: 
 <https://lore.freedesktop.org/e1cecbe1-9171-42f2-9563-2946bc0b7daa@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/31/25 8:33 AM, Timur Tabi wrote:
> On Tue, 2025-12-30 at 22:17 -0800, John Hubbard wrote:
>> Actually, I should have been much more specific, and should have
>> asked, "what git repository and branch should I be using for linux-firmware?".
>>
>> Because none of the branches in either of these seem to have any file named
>> gen_bootloader-570.144.bin:
>>
>>         https://github.com/NVIDIA/linux-firmware.git
>>         git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> 
> It's right there, in the `main` branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/nvidia/tu102/gsp
> 
> Did you forget that you need to run the installer script, and not just blindly copy the files
> over?

ummm, maybe. OK, definitely. :)

thanks,
-- 
John Hubbard

