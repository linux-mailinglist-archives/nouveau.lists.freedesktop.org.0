Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDCCBA8E2
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121CE10E400;
	Sat, 13 Dec 2025 12:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="c8Enl3O5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Wed, 26 Nov 2025 06:05:56 UTC
Received: from outbound.ms.icloud.com
 (p-west3-cluster2-host1-snip4-4.eps.apple.com [57.103.74.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5A210E0E1
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 06:05:56 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPS id
 196471800128; Wed, 26 Nov 2025 06:05:53 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=HWCp2c5E1H7O+Q96GAi6bNWZtazqgioAnhAoRAOXLvo=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme;
 b=c8Enl3O57eRKcDJZkbfGcdsr7PiFY7kXWbeNrtQEqSDKsvrs3tK8fxMD6FNzzYgg4beux7oI339hh59ys01X2+JYr2dfKw1ec0mZyMw91QCRMHmiH17HgdNR1vBUTWkiqCWGYhyxTMpshOE+M80l3p1SDw4tZv5VBqMj2fcx0RonwWRMmqdM48gwJQ+SuhJJI6dIa+h99h917X+4+jiy8TzqTiShKGgsLYAYKMZDMoU0mm/C12DWHd+MA4Ru3jo7UFfF1dvSfV4R+aMzzEs0XDeF+ReaXnZ2gHBlXisPCxhSXKhFBSCsUTbICNft5p9lLtPgP4vjcHfxGWkGkuW8nw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPSA id
 6B6F2180010B; Wed, 26 Nov 2025 06:05:51 +0000 (UTC)
Date: Wed, 26 Nov 2025 16:05:47 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, dakr@kernel.org,
 joelagnelf@nvidia.com, jhubbard@nvidia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 brendan.shephard@gmail.com, Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
Message-ID: <aSaYu8GCrU4XRRNF@fedora>
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
X-Proofpoint-ORIG-GUID: wFF0Gtp_ydERzspMKNjCfa6rmj6Z3igg
X-Proofpoint-GUID: wFF0Gtp_ydERzspMKNjCfa6rmj6Z3igg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0OCBTYWx0ZWRfXymsQqCHtrXA7
 9JocAXq9+tY/wBKofAzoSc93KKbaHQkS5IAFr1oWHAu8ucdlfCROZZPY5NxPYsKekPiguklj+hX
 JG/oeWh/b7aHXyP1/3KZOQ4xL1rA8Ry4S2bQY3sPg0heRapWfnWPDlLcPnOrVdu6LMVuRLzCSGS
 EPZeaUvGLbne0uHsnUXaLnJxUW6SXIQ6wrtyWeIEPmet+cnomrMfCVfx0OYzMICRHG849XW1jqe
 qoRjJ/6MoIThKT6UHS5ihbYpVRcktHxtOWgG75Uk3shC53spk6/Dih0DJ5WWFzlUy9RI5blgsmM
 C+WVa8DEbh/cP2wSuGT
X-Authority-Info: v=2.4 cv=c6qmgB9l c=1 sm=1 tr=0 ts=692698c2 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jbRqzA-MdUj_exYDcw4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1030 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260048
X-JNJ: AAAAAAAByUjj4nuVGAWwEtta1AjBqAz2OWIzp4o5zXtJ9337k0jxRdecd4vexnKRY0FXg5E2AAYgmxqqCq/8fpSAtOeU1rfp+QMaLG8taQy/a0xkkf3hv10sVF2eAIDajARjSK1chsy2FhgX12zEktMEWFyI6Lxbjn81CXCOCMxUCRQbo5pahYzR76xsmmNQsX4Ocpw1BMI7AFqwjbLSD/bcjg72ezlqqX/ACoWvd61J7/6I9OeA5gr3KD2l0OmEMrpzE7oOIecE7th1gP2NwUmJ6gYEUTr4wuWvIKt2Y/uo7VgX6loUjICD2AafDRtVuWkNIdYL1NAR60n9zSPl+13iWMqoWoUIoP7ExL51JorTx0+ffLTOBi8rof5tK67F6DRHIpvOP8JRAuG7gZcNKRz9n1yteVWoJBMxciCwYUgoSeQqc1Ejw9Qhbpj/PfE/EKzFqurriS6TrhaQoSWQyZw91wb20hKGmo4+baoc7SuTNZEo80Rm6k24mFvawi4enFc7SHWYhCkIbwB3xWYNYJ+Vsiqz8tMEnKRSa1s3Yg7hDa0YUTDRVe9H49KAS1h7NiV3p1vDollo8gVZF9ya5S5TbgBPA6HhgzjFwV2wWZ90FnvgehY8Okzc5mlzxoWlQx1JotTIsqKD3/KgJdrhus2OIQiayeVvicqEKCAOIps5qPqG3zLqZ4qMU9w2Bz/ZIhpCkbKDpx6AQ5VRrBX6IIJw9Crjgg==
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

On Tue, Nov 25, 2025 at 11:55:08PM +0900, Alexandre Courbot wrote:
> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
> >> >  impl NovaObject {
> >> >      /// Create a new DRM GEM object.
> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> >> > -        let aligned_size = size.next_multiple_of(1 << 12);
> >> > -
> >> > -        if size == 0 || size > aligned_size {
> >> > +        // Check for 0 size or potential usize overflow before calling page_align
> >> > +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
> >>
> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - well,
> >> I'll admit it looks better as a placeholder. :) But the actual alignment
> >> will eventually be provided elsewhere.
> >
> > What about kernels with 16k pages?
> 
> The actual alignment should IIUC be a mix of the GPU and kernel's
> requirements (GPU can also use a different page size). So no matter what
> we pick right now, it won't be great but you are right that PAGE_SIZE
> will at least accomodate the kernel.
> 

So, maybe what we realistically should be doing is aligning to the
larger page size when comparing system and GPU page sizes?

> >
> >> >              return Err(EINVAL);
> >> >          }
> >> >
> >> > +        let aligned_size = page_align(size);
> >>
> >> `page_align` won't panic on overflow, but it will still return an
> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> >> you return an error when an overflow occurs.
> >
> > The Rust implementation of page_align() is implemented as (addr +
> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
> > if the appropriate config options are enabled.
> 
> That's right, I skimmed its code too fast. ^_^; All the more reason to
> use `Alignment`.

We would still need to ensure the value is a multiple of PAGE_SIZE
though right? Like if the user requests a size that is _not_ a multiple
of 2, then we would want to align the value to a PAGE_SIZE. Which is
what the existing logic does, it's just always rounding to the next
multiple of 4096. Maybe I'm missing something about Alignment and I need
to spend some more time looking at it as an alternative here.
