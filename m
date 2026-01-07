Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E36CFBE85
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 04:56:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B87CE10E182;
	Wed,  7 Jan 2026 03:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Va+nN9Vq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 254B944CA0;
	Wed,  7 Jan 2026 03:47:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767757664;
 b=W08KoMjIurYkPDMZyFwNUf0vtpB7zx7IRiHoxJGiw09ouUXCz/UEapl4N2SvMWogMoUde
 v+GD0VayKVBZCxBrHsbJ06eB+EmBh35De2dM4lmWb0cFjcrAorE5SSxxg4GGvQ/RqXb6PrP
 vfTCqZG84BHTv/ojx58z5are/0XuEQlYKCF/HMe9krrm6eygTCeODjGX+9RxXgiqSkijmI5
 C84Dqrto230A1DQOT2wzrGLMukpypNRxFAndHkgwrVNWm7icNW27uluxgbq+fDaR/dA/COb
 dJoWnguqHHKIjbIKV2kZOOHYr1kxUw5Uhf00QSuZBRYX5jwF7qrjWGeAnqrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767757664; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=T+SCyKIXMXawyHsPv9s3KrhQ9LOWxly6PMktDuH7wMs=;
 b=awTgGRzZO1Jw/f4Y8hqJ7uJa3bIxG++kg40da8U60QVAa+gYGHG0dFg2UtI5urcUZ+qzj
 nWomX0KE0tsRe3BWlg1FJhZ9ZPCenk9yK39ElbHBRHFwir9/4z9oLMVCZNadGZ8MC9Ixrgq
 dqmmUvvA+RnBG0+Nv1ILCjCHwY8suHwqZI54786r9uiFMOfVi+wrpUHxzqoWQYPp+WoWH53
 /zQA6fSAlusW3wy1TGDO8XkNonlMWy6IYQWJ+c1gGFjC8j7BDggRye8RWGtmSBp+xCtHAHi
 AlTl0UAVtglXv5LMqExkMEqGKfJUXkYxbJiC8fxXbgqT7CSswzUHhuZJfHsA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C07B44C95
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 03:47:41 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6333610E043
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 03:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTi9Fcu/Q1vMe0XkhN8Qn33RJkKZFu0TK/u2kaJCrv6IORc4wLevqB5tKQCbB2k3FWSJRMnbwvpyBvkWJGqXgVT55tuBJ71stO6TSEuqy96T3Ih4quptGsPGRTIu6GKT8YwJWBbMMSmDl4WLgxAhs7Y9XFXFjB0Y0Dk43PcQA9HSll/f0VmKxmNGMTJXPBexW37lGFVRSgKhPkv/RFmM+j8SNW2ldWMf1bPHmqC1DzRja+6EyoOBKTRQok5FFbJhzpZdoRQnkxB7bPQae2S4jQj9L9VxHkOXPLF2gi6Bp1UwcB6GqS0spKg45ei7Zmex8gNr6xIF2JxFFVfcyZmW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+SCyKIXMXawyHsPv9s3KrhQ9LOWxly6PMktDuH7wMs=;
 b=KtUxTmrZW5bPLdEqlizR+tjsaqayoZXQaiu9g7RWfswaVpUE41OjuJal+UqW5KRVNHyUXqHaNoNiyt10+ZSzL6SNu2u95HcJlwIVxp53BAz5dlecrOVlhGO/Jl48QSVWSqOKMJjOy5Ch1kJ/+pgizpN3fYXCN8mAYGIu7+f/yRAwJzY9lrsqXQXmXK0Uw0gKAQ5sw6uXSIYGU3BaCKjTfI80BwN11kabB+Zka2y9dYtFrC9CDuGAEYgDKkqITbXfBfF1uC9szaP++Ma8u1L2r29Re1gWS/WgcAOX5a2b9U9ZBJq71+3sM1d/pqtDLzWLDvMLegNIx+/N8iAZhuxHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+SCyKIXMXawyHsPv9s3KrhQ9LOWxly6PMktDuH7wMs=;
 b=Va+nN9Vqe/8aOjnk0OmzsM/9Fo2KgCUzShSsO4uW8kd/p+HHbFIogaJLrpxqVbDeIXOiW7tpksYh8yoThm0TAc5oknW1Tc2Sz6jr5dz4YTviz5eiaui4huQ6XMXz3QGIfXpcnzNpo9JSdsYz8PCUDJjHsKA6L4vkSRqzjx4IKHlcukqj+PlRFZVrHrTokOfOZ2TvPa6xV4vJiKAlwk715tt3pXkRcExSvhVFKJ5KMyqeMZfDHGFdUQqCSLprLt+5XvQjLnALFo0Oi18Qoq66vuy+kqXS0/iPZyupeT3bycWNWq7uZ79U2f0dss9Xm1qOLwHtmBnTVaiuCAXkczn1dw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 03:55:52 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 03:55:52 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Thread-Topic: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Thread-Index: AQHcf3RmcGBTVmvpLUmFj2S7UNF7AbVGFCAO
Date: Wed, 7 Jan 2026 03:55:52 +0000
Message-ID: <CDCAAB8A-ED70-4A74-AA97-F8DFB293E0B6@nvidia.com>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
In-Reply-To: <20260107012414.2429246-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SN7PR12MB7909:EE_
x-ms-office365-filtering-correlation-id: cab4c8c1-3297-465c-9691-08de4da0a707
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WkFvTThPcWhnTVloYlRhM01UbnN3WXBXbU9yTlRhclJtSXlHUTNPMzYxbDc5?=
 =?utf-8?B?cktoeVlYanJpSThXZVNYMnhsb01hWndtay9LYVVZUVB5VTBXRDcrOHhIaERR?=
 =?utf-8?B?M2ZwWkl1elJKTVVzQWpxUFBidUdNclhIZEw4dFNSM3dONHNCYmhlUGEyYUxE?=
 =?utf-8?B?SU1BUWQrK1Awd205TzdiWVlQTml3dWlwWExJZ0JrZ1dGSEFpSllJNG5NRmZ1?=
 =?utf-8?B?aEdLVDVpbFd1U1BrNFRRUEJnaDR4d3VrNG9jYmRDMUNGamlkUkRLYWppcXpr?=
 =?utf-8?B?Nzk2cXdXYmFyTnN4VXFLWENEc1NOVExnb0pXUURyVVMrWDZySVUyTmNINkRm?=
 =?utf-8?B?elgxMzBBU3dQazNXYkcxTzQ1TUdUODBvT1lTdFAyN2V1VmJ2WStpamxpWE9L?=
 =?utf-8?B?eDJxRVdnKzFJZ0hnNzU3ck1XUjllNFVkNE1mTzEyd0p2KzZLdDZwaWRMV2ox?=
 =?utf-8?B?bGMzbTdtbXdUUnRKM25MODd6RW1XSHd2cmI4b0VsOXZUYUlhUjNMNXBySk94?=
 =?utf-8?B?dGNiKyt1dG96dkdTTVNOemZObklKd3Zsei9VYkI1aTFsWWhuT3lreUxyZVl5?=
 =?utf-8?B?b3lNbkMwV2Z4UUxLUDVhZ0EreFVYZzhBa2VxQ0pDRENNY1NBb29RZFg1TUFN?=
 =?utf-8?B?VVFxMCtaZmI3QlQ1R3o1V1pDZVhMWWl2UDhRTjBDOGJsRmx1WHNvL1pkM2VB?=
 =?utf-8?B?OENNMS9PQnlQTjYzWlZUaGthb1Q1MXBsSGVORW91amJHTjFYS3dHblpDTEZ5?=
 =?utf-8?B?Tm9ZSmdNNUVFbkY3RkpOTjdiWHJZWDRnUUZ6dkUrVUYxUk9IV2ZKbzRRRzRK?=
 =?utf-8?B?T2lha1NxUEpGMWtza2JVT3Fxa3hqK2xkZnVuNUFlb09KUitaUUtDZlNiTkZk?=
 =?utf-8?B?d3JldUVOcGVXd1ZQZ2wvS0IxekRQZUtjN0VvbDRYeGJpUXA3eXFEMktQcVJD?=
 =?utf-8?B?Z3hzaUVEaUdaZ3RHMGNYRm56bDRRWmozV2FXbzFQT2RGNVVQc3dqT0tBT0p1?=
 =?utf-8?B?WmYxTDFYMjRRbEg5azRTOU16bE1hcGcweVI2S2w0b2FBMDNTU29yRUlJeWNF?=
 =?utf-8?B?VGJHejZ2MWdtYThhU1MrZ1JibG55NjV6YWVYVG5IekI3OXBqU0VDWkFPTFQx?=
 =?utf-8?B?eFAwdks3Mm9yWnVzZUJaZHdXUmZBMVE0b3lBSnZubHRRSFJqbkZiMnlmQUVE?=
 =?utf-8?B?UzVGZitubFlsOUhxaTJFSWpSWEMza1BHTEVsa3ErMFJuN0xROGYzTkpyZW1p?=
 =?utf-8?B?anFCbEFOUWsvOTg4TWdzbWZ0b3VnNkpBK3VCemRmcU9HSWE1STFFb3VHZk1R?=
 =?utf-8?B?TUp3VGk4VWxWRG9CYzNlR0kvZm5WR0hvVW9laFA0SXhzY1BDcmQ4c0NjM3M4?=
 =?utf-8?B?WE10UWZSU2l5VDdXNDFvT0VxU2pjU0psa0FBU0VKS0xacjhpSzFxR05Lcko1?=
 =?utf-8?B?cUJ1Y3dnMTJrQXRFdjhCeGlNenRhdXJ1cWExbUExVmRzeDhSdzF4dk04THF5?=
 =?utf-8?B?SzdxSGZHUDhLYnJzaXNJMGtXTXJ3UGE1cGFMZHJ5dW82bzlkR0lmWm8rSWJU?=
 =?utf-8?B?WkU4V1BVek5yU1pFcDYvRWNRK3pCaklTZWdZK1Urai83RThJc1BLT2JRbnVC?=
 =?utf-8?B?OGl2Z1QvcVJ1cW5mVWszbjlCRlRzS1ZSTlF3YjlpOGt2cGgybm5TbWlJRnZy?=
 =?utf-8?B?M1EwcUZ0OHlpaHhkTXI3ZzIyYnlRbFVrQXZwTHA5R2E2MXB4MXhYN3B1elRD?=
 =?utf-8?B?MVRnM3E0QVRWRWlnTm5uam5pdjV4TkZEUjArTGFyUS83d3A3MUhSNWpCVHE0?=
 =?utf-8?B?ZUxPcUJSNWJaTHd3YUJDWkZ2SUphUytBQ2JFSXJCMHd2Y2dCeHJIQmczTTlv?=
 =?utf-8?B?TytRQTdSRUtrUWc3anFDaG1STnVVeTREbFBaLzhuaUNGZ2c4S2NlRWx1WkI2?=
 =?utf-8?B?WTJiWU0valNOOU0yL0VBQisraUh4L1pMSW96OFBKZUZSN3UyZmhFUlZ4bFdR?=
 =?utf-8?B?Y1NGVE9YTXNUS3hmYi9KaVFvTENkaVBKeFFzakdXZ0JWOEc2U3NORitpV05o?=
 =?utf-8?Q?WqRhDr?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1lidGp6TmVBU25TLzZpd0t3TXRVNTNOcFRjQVYwN1h0R0Y5RFAweGlpV2pG?=
 =?utf-8?B?RExFbHlEK1RPMlBIKzU4ZVRwS0t2SEhHVnlPNFJBUU9vaFVKRE15L0s0eVlK?=
 =?utf-8?B?bjJQR09rRFFzSUNaYjgrRmwxQm1ZMzQrYzM1c2FRUWNpWkJMcmZic01uQ0pW?=
 =?utf-8?B?N1FXMldBZ1VVMmRmRytqakxMR2pSZVFxU0ovc2ZOTjdzMUVOUVlvOHFIWm0v?=
 =?utf-8?B?U2xuQTBzbVhDK0h2L20vdG93bUF5L000ajRMTmJtamRTN1JoSXQyVUVCWXAz?=
 =?utf-8?B?ZGJYRFAvY2dRcXRMSU84czBqUWFFaWt3OTd3N3dYMlBVeFN4dVBuOFZ4UVBH?=
 =?utf-8?B?eTlPTkFidEJVNWt0RWl0dmQyL0hSMkJUYTNWYWhEMmp3VHFwSWw5WE9sYmZ4?=
 =?utf-8?B?Zm56SitnYi9DZWxEY0RjTkRNaURtVnRlbWdhYjJiR2tBMnFreThTaW9ReUJk?=
 =?utf-8?B?QzFSM2lxcjk2dDhWTk1uS3V0N05JQ01mckgwV042bXd4bHJQVWFvY2pSTUwv?=
 =?utf-8?B?WHQ2aXlURVJYejQyQ01GNElxTVJTZFFWWnlaTHpVMjlQYXk1dWhtYk1YU1l6?=
 =?utf-8?B?TE9ZQlREblh4R2FYbVF4dkpLekpEaHNDRXI5N2kxMnFEb2tlUnVwb0RMVGdL?=
 =?utf-8?B?NjNoNXEzRUdIYzc0K25rN3YvQUJoUEVJeVA3bk9zangxanBBVDBEYXVoTkFa?=
 =?utf-8?B?K3dDbVgvbUsyRTdnRHk5YUFRbnE1NXV2eUFmYTRqMjlGL2VmODBvbENPd2Zj?=
 =?utf-8?B?d0lGeDVSOXJKNTBIY2J5VWlLNzQ0enpMOVdQUXh4ck9XSjJidVlNN0s1SnlD?=
 =?utf-8?B?Y1YzelRpZWE5bU55RUdxK3NrMXdmU3JwWDg4VEVya0JrWWw3bndGZ245dGhM?=
 =?utf-8?B?U3JnbjExR2diZGcrUDRCVlo5ZUVMNDVGUUtLSDYydTdGblp1UGdZTmU1eTRM?=
 =?utf-8?B?OWVvL0NLeWlPaGpFcHoyd2wwVjg1R2drdUhKMWtHcDFLSFdpZWd4VzJjWEhN?=
 =?utf-8?B?Z3VoMHE4NmZpZVpzTThGK013R2hyNmJxYTJNUDVnNmd2QXdZdjN3YjVBU1RG?=
 =?utf-8?B?TGh3c1dQRldNelNWVnNZTCthMDVIUmI0Ry9oTG1hcy8wZzFpeVZPUm9wK09w?=
 =?utf-8?B?NHhVUmIrOVhHZm41TmFRTEtpaHg5Sit2Yks5Ti9BOEFOZWRYdFViYXlHOXRv?=
 =?utf-8?B?MnNqTFZMaTdHNHpKTDVheDJDZXU1a0FpRTI0VEJrWGk5NFZxNng0d1JBY0NF?=
 =?utf-8?B?UXc2OElwSkJEZ2FmaVluc2c0RkVhUGpJY0pHSmpoYW92d3h1K0hkMS9yU1hq?=
 =?utf-8?B?R3lHQ1ZuNnBlMm5kS1RnN3U1Ym54eGtIaEsrYVE0Ly9uTGliRWZjRXUxYlpn?=
 =?utf-8?B?NmQxcUkvaW1DRG92dFdIMGlrd3JQWnJrWUdHSGs3dHdVZ09ZeE9qT0J4c0NX?=
 =?utf-8?B?YzNiMUNIMDBXNkljME1rQzZxOGpnZDFlNHpMZktmSTJSVUFwSXpBWGI2MFJG?=
 =?utf-8?B?MElnVGNEc1N3emNwOVFzSW1KcWs2aVJ6bS9ZTUY5NFB4WHhlMFJuRDFTcTdB?=
 =?utf-8?B?aHFlSXlEVVpjTWxITHdLYkpkUDVaNmI5ZHIrRjNZMEZkTGpOb1FuRGRJS2Vr?=
 =?utf-8?B?eUg4QnZXdFY5dlRZVllpWGp5a3lSZjFRdGZVYVdBbWUvUjhQK2hVUlBzRDVE?=
 =?utf-8?B?aGtaY052Y3RGTzJpTE1nK2YrQkNqSjF2cEkzQ1NJeHVWRmdwNysvcWVjdUk4?=
 =?utf-8?B?bzJuUjRqdGxMbGRhT1A5aWdEMUo2alNNV2VYVUZGNG9hYzVsU25xcEY1bDN5?=
 =?utf-8?B?ZEZnTnFxQmtlRStGSjFIUnRKTlliMDQrRENVUWtyTTRYb2JZR2llNVJDazNj?=
 =?utf-8?B?RjdIa0tmUG03cERwbFNPWHlEbFJya2pqVlhjSE9KenBkSGFhbHBBbzM1dG1K?=
 =?utf-8?B?OU5YVnI3eEVnbWx1YVYzWFRXUTNGdWZDYTdId0Y3THpJUTVYK0lwME1qWk1o?=
 =?utf-8?B?NlRWbFBPMTBoVE4wMVdKbUpTaEE2UGNSM2dzQWJsY1VqRjVMYkh4cnBFUDJD?=
 =?utf-8?B?SUcybE5ySzVTNmhtL0hUeSs4VWZCU2srdSs0QjVXSGIxWE5KSXNuNW1GYjR6?=
 =?utf-8?B?bSsyZkhKVVdlK1dsNUxLUXZEaEl6cHJranJOTHEwNDZ2clFlZUdmYUFuRURI?=
 =?utf-8?B?Y29ENHZSR3Uva0p5RTlTRWo4OGRUYTc5YXRDaS9wc21oVXhmQWFuNkljbTZJ?=
 =?utf-8?B?ZU1WODErRjl1NHR6VTIxS21URHJ0SVZxcXZvdUlSV2kzdUtxK2VyRkltTU0x?=
 =?utf-8?B?SXY1ZTFXc3c2dU5JT2lHYTU3VW4rNDVzZS9qeHNIMGtpMGhOQ1d0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cab4c8c1-3297-465c-9691-08de4da0a707
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 03:55:52.5028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 D04wdXb9BxRRHYIpoTChG1jmNzH6eM86+RJlC7Fq5Nmfb+seS4ABG0yggX7JusmeycPJFni45SiXk+tFZhZtnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909
Message-ID-Hash: 5N6C2Q77EVORLJ4HRB5P4RUDAGXHYDNQ
X-Message-ID-Hash: 5N6C2Q77EVORLJ4HRB5P4RUDAGXHYDNQ
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5N6C2Q77EVORLJ4HRB5P4RUDAGXHYDNQ/>
Archived-At: 
 <https://lore.freedesktop.org/CDCAAB8A-ED70-4A74-AA97-F8DFB293E0B6@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gSmFuIDYsIDIwMjYsIGF0IDg6MjTigK9QTSwgVGltdXIgVGFiaSA8dHRhYmlAbnZp
ZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79UaGUgTlZfUEZBTENPTl9GQUxDT05fRE1BVFJGQkFT
RS8xIHJlZ2lzdGVyIHBhaXIgc3VwcG9ydHMgRE1BIGFkZHJlc3MNCj4gdXAgdG8gNDkgYml0cyBv
bmx5LCBidXQgdGhlIHdyaXRlIHRvIERNQVRSRkJBU0UxIGNvdWxkIGV4Y2VlZCB0aGF0Lg0KPiBU
byBtaXRpZ2F0ZSwgY2hlY2sgZmlyc3QgdGhhdCB0aGUgRE1BIGFkZHJlc3Mgd2lsbCBmaXQuDQo+
IA0KPiBGaXhlczogNjlmNWNkNjdjZTQxICgiZ3B1OiBub3ZhLWNvcmU6IGFkZCBmYWxjb24gcmVn
aXN0ZXIgZGVmaW5pdGlvbnMgYW5kIGJhc2UgY29kZSIpDQo+IFNpZ25lZC1vZmYtYnk6IFRpbXVy
IFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQoNClJldmlld2VkLWJ5OiBKb2VsIEZlcm5hbmRlcyA8
am9lbGFnbmVsZkBudmlkaWEuY29tPg0KDQpUaGFua3MuDQoNCg0KDQo+IC0tLQ0KPiBkcml2ZXJz
L2dwdS9ub3ZhLWNvcmUvZmFsY29uLnJzIHwgNiArKysrKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L25vdmEtY29yZS9mYWxjb24ucnMgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uLnJz
DQo+IGluZGV4IDgyYzY2MWFlZjU5NC4uZmU1YWJmNjRkZDJiIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uLnJzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L25vdmEtY29y
ZS9mYWxjb24ucnMNCj4gQEAgLTQ5Myw3ICs0OTMsMTEgQEAgZm4gZG1hX3dyPEY6IEZhbGNvbkZp
cm13YXJlPFRhcmdldCA9IEU+PigNCj4gICAgICAgICAgICAgU29tZShfKSA9PiAoKSwNCj4gICAg
ICAgICB9Ow0KPiANCj4gLSAgICAgICAgLy8gU2V0IHVwIHRoZSBiYXNlIHNvdXJjZSBETUEgYWRk
cmVzcy4NCj4gKyAgICAgICAgLy8gU2V0IHVwIHRoZSBiYXNlIHNvdXJjZSBETUEgYWRkcmVzcy4g
IERNQVRSRkJBU0Ugb25seSBzdXBwb3J0cyBhIDQ5LWJpdCBhZGRyZXNzLg0KPiArICAgICAgICBp
ZiBkbWFfc3RhcnQgPiBrZXJuZWw6OmRtYTo6RG1hTWFzazo6bmV3Ojo8NDk+KCkudmFsdWUoKSB7
DQo+ICsgICAgICAgICAgICBkZXZfZXJyIShzZWxmLmRldiwgIkRNQSBhZGRyZXNzIHs6I3h9IGV4
Y2VlZHMgNDkgYml0c1xuIiwgZG1hX3N0YXJ0KTsNCj4gKyAgICAgICAgICAgIHJldHVybiBFcnIo
RVJBTkdFKTsNCj4gKyAgICAgICAgfQ0KPiANCj4gICAgICAgICByZWdzOjpOVl9QRkFMQ09OX0ZB
TENPTl9ETUFUUkZCQVNFOjpkZWZhdWx0KCkNCj4gICAgICAgICAgICAgLy8gQ0FTVDogYGFzIHUz
MmAgaXMgdXNlZCBvbiBwdXJwb3NlIHNpbmNlIHdlIGRvIHdhbnQgdG8gc3RyaXAgdGhlIHVwcGVy
IGJpdHMsIHdoaWNoDQo+IA0KPiBiYXNlLWNvbW1pdDogNDM0ODc5NjIzM2U3MzYxNDdlMmU3OWM1
ODc4NGQwYTlmYjQ4ODY3ZA0KPiAtLQ0KPiAyLjUyLjANCj4gDQo=
