Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B601CBA90A
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16E010E41F;
	Sat, 13 Dec 2025 12:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="JL698SOz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 4610 seconds by postgrey-1.36 at gabe;
 Wed, 26 Nov 2025 22:31:30 UTC
Received: from outbound.mr.icloud.com
 (p-west2-cluster6-host12-snip4-10.eps.apple.com [57.103.70.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC0E10E6FA
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 22:31:30 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPS id
 044D41800B9E; Wed, 26 Nov 2025 21:14:38 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=9fT4oAcdwmb9FftlHv87WwVhJYcTpWgu/PHJ1lj/4GA=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme;
 b=JL698SOzEhGoD1chZYyvIDVuTTjZmLyUgxFprJB+ST0kRF/Nr/p5VPQMj46eqjbTNcTQzI8arWmDwP+J2ipq4Jsd+xUzCTo9xTx5HnqgGbQ8MI6E8AIKRkdH3o0gnPaEPMaK5LKt7i5/ZlkjDxaKsUhclcROmx/YbwHmIDW8gaQ7TOD9RASs9rIcVaJ7/zTa8hkv+BXCr/u+2wKU19j5ely2UZ70SbgIyik5A1rzu1MhFTl8Z9Wzl8cQlTvWpy1fd+8MStPrq8zaB6Se0x3fqpyueCVIFRid/ujrG5kW/gPes9YWRPtWwZkkX3eCyhA/1WtNFqMjZlW7iiQNrCQUtQ==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
 by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPSA id
 E8938180087D; Wed, 26 Nov 2025 21:14:35 +0000 (UTC)
Date: Thu, 27 Nov 2025 07:14:32 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, dakr@kernel.org,
 joelagnelf@nvidia.com, jhubbard@nvidia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 brendan.shephard@gmail.com, Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
Message-ID: <aSdtuN-iq7L6lx8D@fedora>
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com>
 <aSbOWhKIpCBm0NKL@google.com>
 <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com>
 <aScCSnRIsRjLrccU@google.com>
 <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
X-Authority-Info: v=2.4 cv=YvwChoYX c=1 sm=1 tr=0 ts=69276dbf cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ikd4Dj_1AAAA:8 a=6RXHk0DhdqaOpD5bTfIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Ert8KlBh68hF0j-DAzaWiBQ0tYzzzlxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3MiBTYWx0ZWRfX5vO1X52JY7C5
 5YeX9vOt89Z7Ea7VCBbn1RTU8pcTZU8b0VHHrl4RbQrhK+R8VLNKG5cv28X5erYM8O1hy5PkZKE
 Hrc7riXLBTU4vgR/VeTOJYIIFRV6W7e4QoreFynwbw25+Ftqz2WX/gqsMQOvGIatwN/EJvb4dXf
 8SNNKCVvXYhSh3joUa8wVvIYtfRrPB1kVVMQJiJp7KJBm8I/dzQiYnknGrNohV/MT2LDN4jDIIS
 qb4TqNs3BETRAM5acEIGF1wg5FD96YSk7K+TtOZXf+L7+JAh1XpMdanumlaew9fMnGw8lgnt2ns
 F3SzPdrYQAWyP4J1n1n
X-Proofpoint-GUID: Ert8KlBh68hF0j-DAzaWiBQ0tYzzzlxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=998
 adultscore=0 clxscore=1030
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2510240001 definitions=main-2511260172
X-JNJ: AAAAAAABb7lLLMfI6LsGrgVjVxM99939G2AVNsfymHWbc7gBbZ2e6JHu88fFpcGfJtbbqD5JOnQBePMZ6ZFc19CCEZMezUdYDRgxXLNykcS43rP6rTL6ajyBXGmXKPNkthUQPUV6Kqt3xuZTMRyi1QtTCnjipCAV0XCJq23CMicyTQeUGqGoHUcxA2go4Uza1TeyjOtGoIsylqd1fjoU3XWsSqNPG31ElYckTEWacpeqbkiO5d6zPEq2VMX/RaGUdBJ29gzbARQSJqMattyho+K3V23YSFbdoaQPHoBC6xrdY4njDzEbtRCYuDI8br624bY5o5cWNinAAAj5QBTwwzokzUxzuWc8/Htth2phukWBiuLHgA1fxToPgy1TrBhpxeSyMfXYg7X9e4Vii800AOmVVxKle1x76n8WRYqsKa+lWHRGe6PRkPFF5GZvaeFeJ4KeIRht8wcIyPB/faZaErH0DFHXAnAzk+O8F0h5FVPDqIt9Y16MG4bX1o2wvMiuIkU4cJo16QEVbLR3k54Dl8wFbN9ubOLkNpiNGQX7aUiCBRC1zcj9g5i+ge/xpsaVQgksNtkCMdneDJCHpNgF2LpsfsD0B3B1Geb6v1aBtrOeCtA/Z9lZUvstMk9KW3ecB7zAn3CF2F2H9smeOhfB+rvHV9tatLMNQ1Jmi66f3WQkMiGOZ/nuWBaxfIzShXkY+FEcW/Qg3TSQLPibKJWlv1XPl8GmM+L1U+oBr9iJyG2T69aJtjhQQGIBVhyOokEmSGWE
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:03 +0000
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

On Wed, Nov 26, 2025 at 11:00:00PM +0900, Alexandre Courbot wrote:
> On Wed Nov 26, 2025 at 10:36 PM JST, Alice Ryhl wrote:
> > On Wed, Nov 26, 2025 at 10:22:14PM +0900, Alexandre Courbot wrote:
> >> On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
> >> > On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> >> >> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> >> >> > On Tue, Nov 25, 2025 at 3:55 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >> >> >>
> >> >> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> >> >> > On Tue, Nov 25, 2025 at 3:29 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >> >> >> >>
> >> >> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> >> >> >              return Err(EINVAL);
> >> >> >> >> >          }
> >> >> >> >> >
> >> >> >> >> > +        let aligned_size = page_align(size);
> >> >> >> >>
> >> >> >> >> `page_align` won't panic on overflow, but it will still return an
> >> >> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> >> >> >> >> you return an error when an overflow occurs.
> >> >> >> >
> >> >> >> > The Rust implementation of page_align() is implemented as (addr +
> >> >> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
> >> >> >> > if the appropriate config options are enabled.
> >> >> >>
> >> >> >> That's right, I skimmed its code too fast. ^_^; All the more reason to
> >> >> >> use `Alignment`.
> >> >> >
> >> >> > Alignment stores values that are powers of two, not multiples of PAGE_SIZE.
> >> >> 
> >> >> Isn't PAGE_SIZE always a power of two though?
> >> >
> >> > Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
> >> > It sounds like you have something different in mind than what I thought.
> >> 
> >> I thought we could just do something like this:
> >> 
> >>     use kernel::ptr::{Alignable, Alignment};
> >> 
> >>     let aligned_size = size
> >>         .align_up(Alignment::new::<PAGE_SIZE>())
> >>         .ok_or(EOVERFLOW)?;
> >> 
> >> (maybe we could also have that `Alignment<PAGE_SIZE>` stored as a const
> >> in `page.rs` for convenience, as it might be used often)
> >
> > If you're trying to round up a number to the next multiple of PAGE_SIZE,
> > then you should use page_align() because that's exactly what the
> > function does.
> >
> > If you think there is something wrong with the design of page_align(),
> > change it instead of reimplemtning it.
> 
> In that case I would suggest that `page_align` returns an `Option`
> instead of potentially panicking. Does that sound reasonable? I cannot
> find any user of it in the Rust code for now.
> 

This sounds reasonable, and I did wonder when I read the comment on
page_align() whether it should just implement that check within the
function rather than relying on callers. But, I think changing the
signature of that function is probably something that should be done
separately to this change. I can't see anyone using it atm either, but
there could be unmerged branches or pending reviews that are using it.
If that's the path we want to go down, and it sounds completely
reasonable, I'll send that separately before posting a v2 of this patch
to use it.

Happy to take your guidance on that to satisfy the logistics of the
kernels ML driven patch approach.
