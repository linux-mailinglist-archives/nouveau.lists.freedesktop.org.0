Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85831C08A87
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 05:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C82910E23F;
	Sat, 25 Oct 2025 03:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OLZZ2nat";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E40E10E23E
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 03:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiYI+8+WtfvkdU5oo+2eSNJbh35sGTUZ9ZJQBs20IhdyX7rbliupAIONdZhT19i//VQTA6bmh4DfukYSeM9hxtrpt5kdmcFrYrcHnJmUeNCfIkYk3BKxcCa+ZSX5SFD++x4ciY96N48B0BK85wiNNtwqSn7oa+5vRFPvGCFJ6lofQ//ek0aKFCR2I5W3CzfKTM2eXw3P1Obrc/ji4yVRoQHVMW5oRNkOwaVhl1sYWMLWBVBoykR0uHeM2jbBc7IJir3z6JcI+i8mK8p68HBpG/YGrz20tZCQqwfXdsyRLG0zfbpIHSRw/hUoauhtW+XESwaB7k9QvfRTKx2QUhKKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvILv5wL3xTdFd6er/ChJYhN0VQUznIsraksOF3WeOg=;
 b=olTn0pr5vBmmNVtHl0Qy2KzWqW07Vk0748r81m1zZrIPyWGf+VVNP2tYfH1pUJV7sHy3LBEphCFjvhFrhl4SzxnCFx67y603ErPHGghcZHcS8LYuMSUS/7x/IPckYZ5Mall8ezjaZrWSRPsovbZrz6Lf3ecWUx92dvQ9BM7PW0zfmt6wB6NAPnNwamQZEiQ8pwTmMqYj+EkHIu4XH8mtTMUJxZXUGhrBnr+fxg+W//EF+tx3+xS3/6Q9f++ygNpbAbHCjcO/l/a3Q7M2iBsn3ps+LhwMHTr1IvTB8uDj5EElEKchHrnTUSr1U71G3w8GsmIpXjb6LZ7CQH8Y4VD3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvILv5wL3xTdFd6er/ChJYhN0VQUznIsraksOF3WeOg=;
 b=OLZZ2natEf7UXoExFdtbni7TNkHuEG1zFwlMAxHhJS/zKbSXOTpAApNc4uWLfEcho6a9pqRgC/FVtg9K/N9dtEAfSa0fUOxS/XEiBXZwhkhhFMyCAfd8H4wzGDkC7NpwzFSibIkpDhJRhmCK2SG1GO43rA4A6GbT3d0JFexCdkferum3s2skJZBZDFpAfqLVvqn8cnpOTgBTa2rF+7VruJny2XGF7+42izeuTt6Uit3joFr4OQh3G/gQdQE9xN0DuYcPVyYtcdnfg7W9KDNp1YZ2A4tLin0EItCLA4FcYPmaSw5Pptvwi9v7lo2Gmwv+UuZafGLX/AF+KbiUbZAB0w==
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:45:50 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 03:45:49 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Zhi Wang
 <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()
Thread-Topic: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()
Thread-Index: AQHcRUvZPOiAWNumVUCwCC5jVa2OnLTSNkWAgAACtyg=
Date: Sat, 25 Oct 2025 03:45:49 +0000
Message-ID: <BY5PR12MB4116A592F878470656329A9DA8FEA@BY5PR12MB4116.namprd12.prod.outlook.com>
References: <20251025010815.566909-1-jhubbard@nvidia.com>
 <20251025010815.566909-2-jhubbard@nvidia.com>
 <DDR36ZDIVQR1.1W43G99PEGVQS@nvidia.com>
In-Reply-To: <DDR36ZDIVQR1.1W43G99PEGVQS@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4116:EE_|LV8PR12MB9134:EE_
x-ms-office365-filtering-correlation-id: 862bae0c-1933-4cc8-07cd-08de1378fd3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?6eZBMBV2yjrK6bNkk5e3naCUURa5Gon/79O7oMql/t7nEMgz6Z7zK/iJCy?=
 =?iso-8859-1?Q?ilQblAG+93lKfw9Lh1B8i45+jnf8tGCGQUXDwhDDNJsiruxgjtooM3Zrpr?=
 =?iso-8859-1?Q?z2zB1bKjRODrhTzbNnMLYSaDbnOCPudeLGagKeILdpmYzfAYv3b5rCDdl7?=
 =?iso-8859-1?Q?Eox9nJdetvOvAnOejqQ+/uDRTLofJAkbNBYAY9dnvyw+E1Q0t43v21hHSs?=
 =?iso-8859-1?Q?zTSp79sAGiUGrBwoCnaj3dV6hJSYCbPJQo/bNqT3kVWW0vcSw2EalQ+vh+?=
 =?iso-8859-1?Q?7w43kwAJTx1Pjb6arfkK+6cD1v3JQ+Ilvy2al3XDWzAlTp4mVx0Dv5/ex2?=
 =?iso-8859-1?Q?x48yxpPyQ8BmfA3D7BlmgxFFquwcU1GDZ+M/OY25UtKCcxqIptEYjgCRLx?=
 =?iso-8859-1?Q?n2TTwHmkXV0mjmOZM5YTjMB3NB9pHNhVU3FI9VJxUIHfSqIKbaXNMrrxYx?=
 =?iso-8859-1?Q?KS3xWGjaoNpEE+/0BEMrofDue+l1Y0HbqCOkK7a6YLaw4sDW0YJAwuLJ0l?=
 =?iso-8859-1?Q?czNZ9UFVmSAt0aT2V6mAjF2Cv67S/88g/rW6tPmZa86buPKCEd2V/ZRYwS?=
 =?iso-8859-1?Q?PWg6sZaN8dAlparhHXLUnRIgzval6G53FI0iuXAvc+cHbPHZyiLVpEKjP0?=
 =?iso-8859-1?Q?dTFVA27ZMNR69BfuzTbEeswNOSYjmZrmIyN2SjsJjJSq42fVZb7cYmycMj?=
 =?iso-8859-1?Q?TJL4ghu4CmFMtSrB8TOTs00gm/hyR989ZrtoJ/oZEsYHqSG6NSDJvwksBW?=
 =?iso-8859-1?Q?1j1nobiRlhSmz692PZjVcGjVffm6xtK3EFscmZLWGMhyBEvAgdUgwkabpW?=
 =?iso-8859-1?Q?bj7wJ8lt2uDZUkRoEmxoVlBqmBa7bza4JpnBjsjwNs3faC/PF9iZAV6yAD?=
 =?iso-8859-1?Q?TJPaRq8pRdxsd/iRHXcwI0rjtsMTF9gDRrsfYwkjlsh07jR7oZgrasxn4Z?=
 =?iso-8859-1?Q?s/bLHjCuJuFRrFqMIsYCCS0lEZxWuhzp9I5A5tS5ryo97ULoXFCAyo2uxX?=
 =?iso-8859-1?Q?7VpDg56WL8bJYGPCoAvirEh0ax+gEu56vp31b+f6W5efKKyCbvQLlYNitH?=
 =?iso-8859-1?Q?cN6o8wdeIdb8aNtSaXFID/RsaLplF1QlntyS/RjQRhwY9MTEmsy7J9akKp?=
 =?iso-8859-1?Q?xFUjtJPrGbVsmVYo60RoVPrYRI8uJE8hXypEsAlxQacCSczjnsFQHhFvnQ?=
 =?iso-8859-1?Q?jehLq+ikH6mnMhECI5B8mAzvhoNLGdee9fk14XocYmo3/+BskAsz8OTgFs?=
 =?iso-8859-1?Q?bMOU18v5yJ67c9D4XGZgs36TTY+XM8n+HmyNCNAcIHgEWmGb0UXKtKGb9+?=
 =?iso-8859-1?Q?nk0VofWrfTk+Man1f9iJpKCAMp6DLNHGIvHdisEq8jM/xdaCkE0/OxwySM?=
 =?iso-8859-1?Q?IvLdg6rhd7lkmeR9IUbIujiL7GH4HguLq8+Gd/ykOnm2T8UeSBMAwMH6U2?=
 =?iso-8859-1?Q?QlcEeC89waia3uSXJRGO8IJYKwb+Q6Ffd+P6sIGxMHR4cDxyQc5OIc3tMU?=
 =?iso-8859-1?Q?V71Vs8wQqrfn9rVM33uYXpg+ZFjV/G7UAVAkrLSGo8asY1m7tA87B69JeT?=
 =?iso-8859-1?Q?DsRmisijwvKEeAoMBif4rVAXB2kk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Uxz2ykEHKBkVl2PzZCZlO+01MdMwvoiiaJRFdVZORjsQODwW8gFJYdNTzw?=
 =?iso-8859-1?Q?tMIIB3AMfDJ5eUdA4gXPvtcJ/BRyQ1tBn37q9KdfU0BoX6w4z8n+7jpd1h?=
 =?iso-8859-1?Q?+LQ4uVoHuQFiRZP5EfSRGTPEteURvsEBxW1ugn0hIs/nd9r97X+WhfU9Uw?=
 =?iso-8859-1?Q?CTdhLSRutvuWKILEYwXKTFIhuzi5QoVq/374W2SN4G56Vvl17ixqbFimJ1?=
 =?iso-8859-1?Q?+8VMDraGNwdPX2pB5Tkm0/mz3Er0PTaCMnoe91tCyRu7avr7gJYwRALx7i?=
 =?iso-8859-1?Q?2yPy6CqHIPqZx98vHCiDs3OZgLzIxauN0YHAErSd1aNmrnJD1YOclNV+3j?=
 =?iso-8859-1?Q?Ku6GMnt0RPVXEBk8fqRx7ywEzcGdkpDnMcIqhEJsXk0idUdoCv7tmvlNuO?=
 =?iso-8859-1?Q?sdGwm6G7IwgFGVWlDzkWeOHxYzSmRr2awmUcHmOZKSD9j1bQngSuJzCNcr?=
 =?iso-8859-1?Q?3l9WLX2IfoctxF/VAWKMtw75Lf5ifaBCZ7cYGwm8OKBq9zkL1gP5mDSPvR?=
 =?iso-8859-1?Q?8EBuSLksZCKjyxfLeC4sh/VGo87JfPX0zpDpUUuPjbEPZatDl8+9xUHPrN?=
 =?iso-8859-1?Q?W8/YycnW0cvysO/Q0rRcBSVnUfqzJwhpIjcK3PzIByyyslQnvPVM+cUJ5d?=
 =?iso-8859-1?Q?bQ2wxfPq2hRFybDh5V1F2BK1q3DN/4sTIxla1TGIGTU7kkfat3raRupUib?=
 =?iso-8859-1?Q?oNwJUI39z5v1xTEhIu23wAsSwxtGWi1lICsikXFMlyaH+lEtkLECxeet9p?=
 =?iso-8859-1?Q?HGsTmCCfBFinUMMTwiXJ5OICQaZ6dqUnMC34HYjsdTepAZ52qc56Ge3z1I?=
 =?iso-8859-1?Q?RiVZhkB0OV6EX5YrTtY2Plar+Ph6LCMGuQKGigCVNJT/7DWIHwOIbQa6B+?=
 =?iso-8859-1?Q?usffL3r/p5SU71v2zjeNKfNdhghPbsME6N/vc3t4dXmOA+BHFokZ3ZmP/T?=
 =?iso-8859-1?Q?Lk/9KunWUO+l8KAWyt4gm9AxB9b6u5imWbJk/d1ZtQjDz6OV8AP/DvEObw?=
 =?iso-8859-1?Q?drLcDBOmS4+yeIty6hmz2k/NjWT8jZx6/PNpfcofF4J4kdSDr4TklJZNb6?=
 =?iso-8859-1?Q?pR/yhOivZJzJL27E/GcV1DFSMW+eS4ab5V4Gxf8K4IhQaMxrlfE6ZwjBoe?=
 =?iso-8859-1?Q?Y9KcQ5DR1PcWJpTBdB8w+n+ItrimWB55o/PWNyzaF7VexVX2e8jq/UPcJu?=
 =?iso-8859-1?Q?SmKXpWIcfIOx91GPc6ZSlNAvxCGWXOVe7yZaO4FEnA1ZqJiNSCvFcJJQ1t?=
 =?iso-8859-1?Q?BlhP9mSZ8xNgfQtStRLvVz0SI1MGNYLCLJadXTOSTc5oYKNseKJwW9sF36?=
 =?iso-8859-1?Q?hKY02H3zAitXquSN5sVdHkltyCBNc3y4tpLjj5Lo5JsmWuLByLb7d1asls?=
 =?iso-8859-1?Q?S/yXiU6TROoqEJgv+Y6IhC2p5yDDJOA7iu7kftBOETUeSo+JkXUoRqnWxE?=
 =?iso-8859-1?Q?8C/V3KB9b4kmJENZ8Ac4j9yLKKAOZcKirDpdsMIijC1ZEZ/ov3KTY8pVpl?=
 =?iso-8859-1?Q?B0TBwe9y1o4Ix1a5ypxM83QdqqmUA4nkRZajQrhmB7RfBfOvAXbrQ+1r51?=
 =?iso-8859-1?Q?KGqd1AK4x+iWpYB/7lPk8toMsHvQEXfyFvfexfHKPmXYatSc1UqE7lC2T6?=
 =?iso-8859-1?Q?qFHW/f5C+jJm5q+ITdMOl3u15pNg2bETE1k89ABZfCouzD9mcIrt0PRg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR12MB4116A592F878470656329A9DA8FEABY5PR12MB4116namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862bae0c-1933-4cc8-07cd-08de1378fd3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2025 03:45:49.8250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrSq+Z1+HPzcUkfhPU9LwwwtkrnO122AQuN+dzWRfmq3EueyYsrrkIlGRALdRdK58NBd4aiJ86dLsJ1VLYf54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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

--_000_BY5PR12MB4116A592F878470656329A9DA8FEABY5PR12MB4116namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sounds good!

(Apologies for top posting.)

Thanks,
John Hubbard
________________________________
From: Alexandre Courbot <acourbot@nvidia.com>
Sent: Friday, October 24, 2025 8:35:39 PM
To: John Hubbard <jhubbard@nvidia.com>; Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>; Joel Fernandes <joelagnelf@nvi=
dia.com>; Timur Tabi <ttabi@nvidia.com>; Alistair Popple <apopple@nvidia.co=
m>; Edwin Peer <epeer@nvidia.com>; Zhi Wang <zhiw@nvidia.com>; David Airlie=
 <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bjorn Helgaas <bhelg=
aas@google.com>; Miguel Ojeda <ojeda@kernel.org>; Alex Gaynor <alex.gaynor@=
gmail.com>; Boqun Feng <boqun.feng@gmail.com>; Gary Guo <gary@garyguo.net>;=
 Bj=F6rn Roy Baron <bjorn3_gh@protonmail.com>; Benno Lossin <lossin@kernel.=
org>; Andreas Hindborg <a.hindborg@kernel.org>; Alice Ryhl <aliceryhl@googl=
e.com>; Trevor Gross <tmgross@umich.edu>; nouveau@lists.freedesktop.org <no=
uveau@lists.freedesktop.org>; rust-for-linux@vger.kernel.org <rust-for-linu=
x@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()

Hi John,

On Sat Oct 25, 2025 at 10:08 AM JST, John Hubbard wrote:
> This also changes .try_alter() to try_update().
>
> After this commit, instead of "read, write and alter", the methods
> available for registers are now "read, write and update".
>
> This reads a lot easier for people who are used to working with
> registers.

I plan to apply this quickly as this was already discussed and agreed
on, and to avoid conflicts with future patches.

If that's ok with you I will add that this also aligns with what regmap
does when applying.

Also planning to add a `Link:` tag to
https://lore.kernel.org/2c5d90c8-e73a-4f04-9c1d-30adbd0fef07@nvidia.com
for context.


--_000_BY5PR12MB4116A592F878470656329A9DA8FEABY5PR12MB4116namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Sounds good!</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
(Apologies for top posting.)</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;" id=3D"ms-outlook-mobile-=
signature">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Thanks,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
John Hubbard</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexandre Courbot &lt=
;acourbot@nvidia.com&gt;<br>
<b>Sent:</b> Friday, October 24, 2025 8:35:39 PM<br>
<b>To:</b> John Hubbard &lt;jhubbard@nvidia.com&gt;; Danilo Krummrich &lt;d=
akr@kernel.org&gt;<br>
<b>Cc:</b> Alexandre Courbot &lt;acourbot@nvidia.com&gt;; Joel Fernandes &l=
t;joelagnelf@nvidia.com&gt;; Timur Tabi &lt;ttabi@nvidia.com&gt;; Alistair =
Popple &lt;apopple@nvidia.com&gt;; Edwin Peer &lt;epeer@nvidia.com&gt;; Zhi=
 Wang &lt;zhiw@nvidia.com&gt;; David Airlie &lt;airlied@gmail.com&gt;; Simo=
na
 Vetter &lt;simona@ffwll.ch&gt;; Bjorn Helgaas &lt;bhelgaas@google.com&gt;;=
 Miguel Ojeda &lt;ojeda@kernel.org&gt;; Alex Gaynor &lt;alex.gaynor@gmail.c=
om&gt;; Boqun Feng &lt;boqun.feng@gmail.com&gt;; Gary Guo &lt;gary@garyguo.=
net&gt;; Bj=F6rn Roy Baron &lt;bjorn3_gh@protonmail.com&gt;; Benno Lossin &=
lt;lossin@kernel.org&gt;;
 Andreas Hindborg &lt;a.hindborg@kernel.org&gt;; Alice Ryhl &lt;aliceryhl@g=
oogle.com&gt;; Trevor Gross &lt;tmgross@umich.edu&gt;; nouveau@lists.freede=
sktop.org &lt;nouveau@lists.freedesktop.org&gt;; rust-for-linux@vger.kernel=
.org &lt;rust-for-linux@vger.kernel.org&gt;; LKML &lt;linux-kernel@vger.ker=
nel.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/1] nova-core: regs: rename .alter() --&gt; .up=
date()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi John,<br>
<br>
On Sat Oct 25, 2025 at 10:08 AM JST, John Hubbard wrote:<br>
&gt; This also changes .try_alter() to try_update().<br>
&gt;<br>
&gt; After this commit, instead of &quot;read, write and alter&quot;, the m=
ethods<br>
&gt; available for registers are now &quot;read, write and update&quot;.<br=
>
&gt;<br>
&gt; This reads a lot easier for people who are used to working with<br>
&gt; registers.<br>
<br>
I plan to apply this quickly as this was already discussed and agreed<br>
on, and to avoid conflicts with future patches.<br>
<br>
If that's ok with you I will add that this also aligns with what regmap<br>
does when applying.<br>
<br>
Also planning to add a `Link:` tag to<br>
<a href=3D"https://lore.kernel.org/2c5d90c8-e73a-4f04-9c1d-30adbd0fef07@nvi=
dia.com">https://lore.kernel.org/2c5d90c8-e73a-4f04-9c1d-30adbd0fef07@nvidi=
a.com</a><br>
for context.<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY5PR12MB4116A592F878470656329A9DA8FEABY5PR12MB4116namp_--
