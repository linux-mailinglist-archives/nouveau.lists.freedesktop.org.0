Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F360A202DD7
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 02:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9086E46E;
	Mon, 22 Jun 2020 00:16:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5ED6E46E
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 00:16:27 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eeff82e0000>; Sun, 21 Jun 2020 17:15:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sun, 21 Jun 2020 17:16:26 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sun, 21 Jun 2020 17:16:26 -0700
Received: from [10.2.167.171] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 00:16:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Date: Sun, 21 Jun 2020 20:15:45 -0400
X-Mailer: MailMate (1.13.1r5690)
Message-ID: <9948121A-CA52-494F-9B68-6C0089E15057@nvidia.com>
In-Reply-To: <20200619215649.32297-15-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-15-rcampbell@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592784942; bh=Lr8iQ6hREjxuIrrKajV9oQHe0CBRPThD6DDsvzRvG88=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:X-Mailer:Message-ID:
 In-Reply-To:References:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=kcNK9B7kDcnIj5KTg2K7ZI3H/ITfv/fVhMe6LNHevMFvtR9mrnxySOqp8KItN6/zU
 uPApsdYyrDEwN9Sdw+J33HBTV6bTaWPReJ7agzPv3XDX1T3jara8+nBSWZCN3Xs7W2
 w26R03Vzir/ckhxS6NkSV4lYEZkuiT4PraqoF+zbtY2f8cnFY7xck3U/xS2wTQsoEZ
 VGQ+i5dfa1qqKFIOZDjoZYuzcOi7z9Tk4SO2qk9YdVUMv5BKQgjNTYfecpvQMIL/kK
 jJPBH28+w+yCFuzHuNrpJZ/vXnn6QNbuqrckX3VMU2Nebqjmp4mgfMcMgRZJfotG4G
 rMSkddnkNVykw==
Subject: Re: [Nouveau] [PATCH 14/16] mm/thp: add THP allocation helper
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Jason
 Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============1416556052=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1416556052==
Content-Type: multipart/signed;
	boundary="=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 19 Jun 2020, at 17:56, Ralph Campbell wrote:

> Transparent huge page allocation policy is controlled by several sysfs
> variables. Rather than expose these to each device driver that needs to=

> allocate THPs, provide a helper function.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  include/linux/gfp.h | 10 ++++++++++
>  mm/huge_memory.c    | 16 ++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 67a0774e080b..1c7d968a27d3 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -562,6 +562,16 @@ extern struct page *alloc_pages_vma(gfp_t gfp_mask=
, int order,
>  	alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
>  #define alloc_page_vma_node(gfp_mask, vma, addr, node)		\
>  	alloc_pages_vma(gfp_mask, 0, vma, addr, node, false)
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +extern struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +					unsigned long addr);
> +#else
> +static inline struct page *alloc_transhugepage(struct vm_area_struct *=
vma,
> +						unsigned long addr)
> +{
> +	return NULL;
> +}
> +#endif
>
>  extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int ord=
er);
>  extern unsigned long get_zeroed_page(gfp_t gfp_mask);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 25d95f7b1e98..f749633ed350 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -775,6 +775,22 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fa=
ult *vmf)
>  	return __do_huge_pmd_anonymous_page(vmf, page, gfp);
>  }
>
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +				 unsigned long haddr)
> +{
> +	gfp_t gfp;
> +	struct page *page;
> +
> +	gfp =3D alloc_hugepage_direct_gfpmask(vma);
> +	page =3D alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
> +	if (page)
> +		prep_transhuge_page(page);
> +	return page;
> +}
> +EXPORT_SYMBOL_GPL(alloc_transhugepage);
> +#endif
> +
>  static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long a=
ddr,
>  		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
>  		pgtable_t pgtable)
> -- =

> 2.20.1

Why use CONFIG_ARCH_ENABLE_THP_MIGRATION to guard THP allocator helper?
Shouldn=E2=80=99t CONFIG_TRANSPARENT_HUGEPAGE be used? Also the helper st=
ill allocates
a THP even if transparent_hugepage_enabled(vma) is false, which is wrong,=
 right?


--
Best Regards,
Yan Zi

--=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBAgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl7v+DEPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKQCQP/R4abSW0mnepE+hQxnoAry2FCsgoq4kfwbLS
z61PThcPrmTTEvbT9kRmqtarVtKhK1u0NxFkzhBYEZA4jfrs9JOufIXWBdhEEI+L
Lp0xXMwc4qEugDb2whgdiTWIWfwhDqzYExaaZMuWlpr2H9Uw+qEENzlBvTBnd2Xa
4cj2nAipD6ggJ4qz/h7pt+2JTNKhNBirkfXqYjoXeWZpj/N0AfUs8IziaHyOwqxZ
1p2KvBeqsOB5M67Mr6TVzOHh1EZEbN7VMRHbXEgw6mBt179v67IGmP129Xp/zzFh
U0KDQiMGUh7rt8rScMpv9v9xbvTXA5Ztpe/ExGARRK9cmOWOr3UHK2fDLwl3WSTl
IN7swIwEBTpKPSWpCEi0f4fiQOqOk9PuexRM6ZxI5W/GYPKR99Fn7cHEMjgESOw1
fKCXPMXx95DDabWoRdMmTPEKkReI8k/RWSJhBq5mIUH8kHNilWgbPhUH/l7pbgMB
W636ZixfVK0q7F95lwwU+fEH5BTfMwwk/usVT0ugRoTsiAFOFEZ3GXi6W8mmp8fo
6oaOysR1M3K01IXl8RRlDrWqK3oPsv2MnNTH2adPCxKKXU8PSRgs9Zcc7d9EIIO1
I7bnvmSZ7pTWK0RaHfv/yIbcfqpyyUt9wJy9kc83VXknBsOjJs9QtOBchjzpBWq1
q2tbBUmt
=CvYf
-----END PGP SIGNATURE-----

--=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=--

--===============1416556052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1416556052==--
