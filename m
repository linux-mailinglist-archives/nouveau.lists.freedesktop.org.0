Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD6262E43
	for <lists+nouveau@lfdr.de>; Wed,  9 Sep 2020 14:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21466EE69;
	Wed,  9 Sep 2020 12:00:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0F46EE72
 for <nouveau@lists.freedesktop.org>; Wed,  9 Sep 2020 12:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9jmtphma7QRrvqZP7Y80CLMYPFhGtig7GiXo8iw/seuC5fDSHvflrOFz8j4HKNHmZxb8m9gwqZBcd7JVFbKoL2x+K1TzIN9xB1RPNjhh+BosjWnVDmA0LJhC4lQSIjvw+2lThfgJwVxD1DOD0vqnletqzyHev+4sanS52/nSsMKGa4Mdamula7qub9mkUFeFKw4DBwFPFiM4PIX7ov0Bd0u++lyC+3EWpaEu3YnippAj+kIzLL/Vz6r6KqSB+kmkuWhTFdNA8N+Gc54lqf81+2zY7qIe8Jc1+Sey4mOpTGwZb+EIOlnePVKV0DI+y48Y5iq5XOTx6qbpF5Klq+qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XFbJgskZpm10PAU8916lsBcmtjivZYi6hV9S5vNROs=;
 b=E80FMszU5UkCdNxPJ2tqzzAnuxPyZNkSiQa3h3rTVE/PdX4qky7MPvGAOzWEjFepCE7H5Efr50JhZF99fUZgEbhFFJ4eqkqq4hEtIIzzxdgSgVd57K60k1zmiRuW/yoWNMrNQf5IqsYQHLD8pGMa6zRBqvdeMhDmNYm/HP1TuO+s6egSA64c7IfF+zttsgUHfEqiES/GuvDV5mhK+xyTILQrdid8/1bMef/xNJgNcmwtrxl/rXY+1rnq5Lqi7YjTzaYZXAdmEhldhzdLewnyFXg8BLcY+j3+GSIf4JL5IFY+A08L/8m/+8i94hlPdu7dXxv24CfBkuMfvxpiEa6/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XFbJgskZpm10PAU8916lsBcmtjivZYi6hV9S5vNROs=;
 b=VjBwv/W2b4ADblZiaxD4Ryy8zCYobZpzmZdmurQtlNR3z7lmRsdVMKXa4/UPAfkFaO++nFzHm3axj3nvKLfVB1K99QTmATazeFFXKBq8RG/z/0+WfJZRcpzWbidG3Df+U2poTu3l2f96YxTtba0+p0/F0ZH/VyrKtOL9SRRO6HA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 12:00:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 12:00:03 +0000
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200909114924.GA17899@mwanda>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8b912d8a-ea64-862b-61a4-2d19fcf8e69c@amd.com>
Date: Wed, 9 Sep 2020 13:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200909114924.GA17899@mwanda>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0060.eurprd05.prod.outlook.com
 (2603:10a6:200:68::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0501CA0060.eurprd05.prod.outlook.com (2603:10a6:200:68::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 12:00:03 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d280f2dd-c531-413d-48a8-08d854b7e2d6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3679:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3679172CD69639C08392B0EF83260@MN2PR12MB3679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gchx+meLectfccdhfotZgoWSs4UBPGhxKnB6ROeqh26vXEAyXpBgqDWtYsSWVNrFD5bnxUhkpb58To+TVrBoAobyL69Ki3pFs0Qum5lIzAXitFr0gDf8Pz4UDCbR9kBZIXl9Zash5XSBYvgqz3A90rzfrZVHKIl3R7hf3IYcSfWIJIAHyRX4hMQG9yDOuT/L5vAV/OV3zpDr4Wl7j4se6XP9xay6PQePmOmqkos6MDsbFn8mvJVUzTZ7Aqvad4UMConYiOpffptFBjlSeUJ/cJUF62a+wZA5KB9XU88MkbRFSBpoav6qrNChA7iiioajfwqGve6QbcVBdPmeU4iek4n+nGHwJpnurs1r3vMJKvIH/Kmlm3CQc7nFl+fiwfmN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(376002)(346002)(8936002)(66946007)(66574015)(2616005)(6916009)(16526019)(186003)(316002)(8676002)(6486002)(83380400001)(478600001)(31686004)(66556008)(5660300002)(6666004)(52116002)(2906002)(66476007)(4326008)(36756003)(31696002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: D9yTrV3gM8GsykqIxd6fSUJR6LFLlgwz+/hldyJeQnfgM41ooh8ggEtd3UaFR4L7uSd2F7z/8Rr0fdUzzaJaJapvqfHYmqVjgiAyMDAgznVlJGq/TcYIoQTG0nOS/FVCdHn+ICZO2jYUPhel7r15PPKkBQCG5j+NQZHjnztWHw/q0YBM58yBkkzHH+M2YCL38T/oJd4874NhxC+CVwOWynSg8x2Pq+SOfflBETmMde1zyJmNX/zoA6mU70FXMX4RFbMZKBNT3uVIHvfesCcrdXFAFXIHkrZM0G3zl0Fuaz15kikii12TzvbB00vTkWEI98ad8sk/t05qUvBvKlKaqvggfhow57OXgLXHyHlvcRRIsVpL0qU+22dSOC5ruS3dBdJA17tAQQgByvSAMTBQ6jwUahL01hWHF81Rp3pcfXlAr0e/G7kAaFhQvYwymxyrxM3yIAp+VurgcgcRq5jCL0X337UWjFmuvNbivsgpKh5sgzLN4q8NJb11HeaHCUQ5qtMF2I4q0sXmmQq6RQanSwAo6AMvoKgb/xcjpu/c1hbeiOkamJjTym5Kudfw/CbnoPO34Zvn/i9k6EJA9I48ovrPulplSnMJ6Vgbb1D/jCmYVI6o3mqvzdZur5+w+s8VkPz5Wued5/gxjzgeVh928JyonvIKZiBz9sNn2eLc7Om7U1JRqzC/TXJr/PR0I7YJPN5+gCipEC9yvizZaM4oxA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d280f2dd-c531-413d-48a8-08d854b7e2d6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 12:00:03.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOYybn6WCQ2SZ661GyYxEJOgb/F5VV3Jk75e4T5yPKYReSvkYY3KXO9mU9iwRY6B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
Subject: Re: [Nouveau] [bug report] drm/nouveau: move io_reserve_lru
 handling into the driver v5
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
Cc: nouveau@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgRGFuLAoKQW0gMDkuMDkuMjAgdW0gMTM6NDkgc2NocmllYiBEYW4gQ2FycGVudGVyOgo+IEhl
bGxvIENocmlzdGlhbiBLw7ZuaWcsCj4KPiBUaGUgcGF0Y2ggMTQxYjE1ZTU5MTc1OiAiZHJtL25v
dXZlYXU6IG1vdmUgaW9fcmVzZXJ2ZV9scnUgaGFuZGxpbmcKPiBpbnRvIHRoZSBkcml2ZXIgdjUi
IGZyb20gQXVnIDIxLCAyMDIwLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYwo+IGNoZWNr
ZXIgd2FybmluZzoKPgo+IAlkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jOjE0
OCBub3V2ZWF1X3R0bV9mYXVsdCgpCj4gCXdhcm46IGluY29uc2lzdGVudCByZXR1cm5zICcqYm8t
PmJhc2UucmVzdicuCj4KPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jCj4g
ICAgIDEyNiAgc3RhdGljIHZtX2ZhdWx0X3Qgbm91dmVhdV90dG1fZmF1bHQoc3RydWN0IHZtX2Zh
dWx0ICp2bWYpCj4gICAgIDEyNyAgewo+ICAgICAxMjggICAgICAgICAgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKPiAgICAgMTI5ICAgICAgICAgIHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPiAgICAgMTMwICAgICAgICAg
IHBncHJvdF90IHByb3Q7Cj4gICAgIDEzMSAgICAgICAgICB2bV9mYXVsdF90IHJldDsKPiAgICAg
MTMyCj4gICAgIDEzMyAgICAgICAgICByZXQgPSB0dG1fYm9fdm1fcmVzZXJ2ZShibywgdm1mKTsK
PiAgICAgMTM0ICAgICAgICAgIGlmIChyZXQpCj4gICAgIDEzNSAgICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7Cj4gICAgIDEzNgo+ICAgICAxMzcgICAgICAgICAgbm91dmVhdV9ib19kZWxfaW9f
cmVzZXJ2ZV9scnUoYm8pOwo+ICAgICAxMzgKPiAgICAgMTM5ICAgICAgICAgIHByb3QgPSB2bV9n
ZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwo+ICAgICAxNDAgICAgICAgICAgcmV0ID0gdHRt
X2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwgVFRNX0JPX1ZNX05VTV9QUkVGQVVMVCwg
MSk7Cj4gICAgIDE0MSAgICAgICAgICBpZiAocmV0ID09IFZNX0ZBVUxUX1JFVFJZICYmICEodm1m
LT5mbGFncyAmIEZBVUxUX0ZMQUdfUkVUUllfTk9XQUlUKSkKPiAgICAgMTQyICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXgo+
IENhbGwgZG1hX3Jlc3ZfdW5sb2NrKCkgYmVmb3JlIHJldHVybmluZz8KCk5vLCB0aGlzIGlzIGNv
cnJlY3QuIEluIHRoZSBjYXNlIG9mIHJldHVybmluZyBWTV9GQVVMVF9SRVRSWSB0aGUgCmZ1bmN0
aW9uIHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCgpIGhhcyBhbHJlYWR5IGRyb3BwZWQgdGhlIGxv
Y2sgZm9yIHVzLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+ICAgICAxNDMKPiAgICAgMTQ0ICAg
ICAgICAgIG5vdXZlYXVfYm9fYWRkX2lvX3Jlc2VydmVfbHJ1KGJvKTsKPiAgICAgMTQ1Cj4gICAg
IDE0NiAgICAgICAgICBkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7Cj4gICAgIDE0Nwo+
ICAgICAxNDggICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgMTQ5ICB9Cj4KPiByZWdhcmRzLAo+
IGRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
