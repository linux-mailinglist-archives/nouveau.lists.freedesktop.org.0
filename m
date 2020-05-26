Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6881F8545
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB726E466;
	Sat, 13 Jun 2020 20:53:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BA889C9A
 for <nouveau@lists.freedesktop.org>; Tue, 26 May 2020 22:29:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ecd97fc0001>; Tue, 26 May 2020 15:28:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 26 May 2020 15:29:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 26 May 2020 15:29:41 -0700
Received: from [10.2.171.79] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 May
 2020 22:29:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Date: Tue, 26 May 2020 18:29:34 -0400
X-Mailer: MailMate (1.13.1r5685)
Message-ID: <B0BF5621-FEF9-446C-AAD9-81EFA1416EB1@nvidia.com>
In-Reply-To: <1ec0511f-e6eb-3e11-ad6d-ad4e5b107464@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200508192009.15302-5-rcampbell@nvidia.com> <20200508195129.GA19740@lst.de>
 <1ec0511f-e6eb-3e11-ad6d-ad4e5b107464@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590532092; bh=cwtuAIOq+85ZyiwcNHD3iSzFYHUjU2pYVvKab5S4Qb8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:X-Mailer:Message-ID:
 In-Reply-To:References:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=OJ4yu8141xYfTos05JStvkCXdsYzpSd0C8gJhS4DYokuTujNxJRM/AzYDbvvN2/Fx
 EJJXr3Ns5xanby9PR2ZxO8jI1rf5Gva/sivcLkLdx32TNggJOswgyx/hDR8ErNr8ip
 /rjWMzOVsngLZ4eAkJAl0u/brqBX7PpcR5oU5G2vFMR1uqh+IY47scqn3LWtFnL9ng
 wXGhk9k1xgHsZTzzZ9DB/SrwYmUYX8m5q01lF6IgmjFa+t2sR5kI3kqneBCEG9PYZx
 wFmtQu2AkihWQfZB/HlrB/gPFg0Bp10HUSMKw9+qHvpRMZjTIXiIspuuSWvRc9j0nI
 GXPq2w9P3Rs9A==
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
Subject: Re: [Nouveau] [PATCH 4/6] mm/hmm: add output flag for compound page
 mapping
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, Jason
 Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============1398492703=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1398492703==
Content-Type: multipart/signed;
	boundary="=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 8 May 2020, at 16:06, Ralph Campbell wrote:

> On 5/8/20 12:51 PM, Christoph Hellwig wrote:
>> On Fri, May 08, 2020 at 12:20:07PM -0700, Ralph Campbell wrote:
>>> hmm_range_fault() returns an array of page frame numbers and flags fo=
r
>>> how the pages are mapped in the requested process' page tables. The P=
FN
>>> can be used to get the struct page with hmm_pfn_to_page() and the pag=
e size
>>> order can be determined with compound_order(page) but if the page is =
larger
>>> than order 0 (PAGE_SIZE), there is no indication that the page is map=
ped
>>> using a larger page size. To be fully general, hmm_range_fault() woul=
d need
>>> to return the mapping size to handle cases like a 1GB compound page b=
eing
>>> mapped with 2MB PMD entries. However, the most common case is the map=
ping
>>> size the same as the underlying compound page size.
>>> Add a new output flag to indicate this so that callers know it is saf=
e to
>>> use a large device page table mapping if one is available.
>>
>> Why do you need the flag?  The caller should be able to just use
>> page_size() (or willys new thp_size helper).
>>
>
> The question is whether or not a large page can be mapped with smaller
> page table entries with different permissions. If one process has a 2MB=

> page mapped with 4K PTEs with different read/write permissions, I don't=
 think
> it would be OK for a device to map the whole 2MB with write access enab=
led.
> The flag is supposed to indicate that the whole page can be mapped by t=
he
> device with the indicated read/write permissions.

If hmm_range_fault() only walks one VMA at a time, you would not have thi=
s permission
issue, right? Since all pages from one VMA should have the same permissio=
n.
But it seems that hmm_range_fault() deals with pages across multiple VMAs=
=2E
Maybe we should make hmm_range_fault() bail out early when it encounters
a VMA with a different permission than the existing ones?


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl7NmE8PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKjycP/3XJhZ/XUzVmTxYQ6iRjWJrpB2rP0Qm21PvT
aJJd4WglE/dotbUGatNjl86bKqfhWVyQSbwPFnsc94YTkkAazZh8FspW6mV2WdQ+
1itzDfkls+hAAXuJcWOOnw23UY5+y8Hy/tfsrqr0sP6UNvJ3wuyXDMBmbQVSyvur
Aa6SAZNJv7LG1YdCJfCI3X92aSziGBd7s3/1Kz2AUagsvP20T4jygQo+6lgepNzy
hEdUKBstpN1T3sRVom1n4BYJK+kDrRVfiYdCFrhJ9ZTIu3K9snEWrsMRSnx7wSX2
dxSZwVx+dqOokDM5DhYZWyif1X0/JZzq7v0P4BNuUJkpXZrCutqQP6nvGxsR+QVX
5GgkLzeUOUqnFJvljtiSkwjUPRblljGFo9WDGEnrVNTDG7uZf56Qz6SdQPwLR9GK
Vsk8saRYhZ6YHPE8QtuByliBhzzZfIUK7oafU8e/1QEo/0zFdL+QEbfUR61/nHpK
WkHcnZRxJ5EGmfGGk4dYq+soIl+0g3oMWIDQ2QFMA1RPf3pzOR595P5ldo6KgPSo
N+euHyai7HSurTxdE4JgN27uM9/d9yq0X3uQGwW/a/Fq3EhiAiUJnfd4s375Wd2y
qcsaP5rxatQo0EeVnGs2vwXgG3f3vFYVhs4FRRogl5EEQE36Y81uLm+pZmjoKfyf
eGcZSDTZ
=zDv+
-----END PGP SIGNATURE-----

--=_MailMate_4B5C64C4-2994-4ABE-B17A-646474CC0806_=--

--===============1398492703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1398492703==--
