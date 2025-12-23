Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01114CD9EA6
	for <lists+nouveau@lfdr.de>; Tue, 23 Dec 2025 17:15:41 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9FA10E282;
	Tue, 23 Dec 2025 16:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="dkPNA7ix";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 69C3444C56;
	Tue, 23 Dec 2025 16:07:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766506077;
 b=rShxxEE7XN3FatTuhNfwUj33SagVp1C5hWD5XwFbxzDMvFKFWxx75Z8CC3reO1Pd+J6oH
 uikmMfDXzFM6wNXhXUDQ9zUrXplX2QBl1CxBmY45yqT19KoXND3fLcY/UYVQcnOLAk95h7m
 pY4mdkciUboP/Qe2y0eaU+64W3fPV3I4yt1MvUIOvpJsethivmuvyL7gntQLHIEB3Voi0fh
 jAvNdza3V7ZjLjUbgmmDWiqkjCqwJOJobNn0P4TFGlzkWvwvclLQyOjw7Xaj9R6HpWAE34F
 QWgHIOXlFVuOpeZ+tQkXoLiZrPLAPYkYrd7D71PdPpQzGu8VgBEZtoflI1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766506077; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PgFncF/RAuPmSd/ndbWFGHlEySnfTyAhpN6Jo23lMt0=;
 b=GEABJKjtpinkzKnEVE7vFZECpJ3vGHWpUitsr/9h75ar76nPGwLIg0HhzBcWNW95ol1xC
 VRfzRAb6SoxdQzK4Kv8qMNjUevQj6cTS3tXQynMM5KBMkInFb2CXC5KTV1b3pz9wRiS+JC0
 EGFghWvPwJCAag3hDfdrTI4H8v+g7u2YEMXAlp13V2HSJ6TMEpLMCk/hjggX5psSH49QDyx
 iNR2SPcDe+0rzpYQ1/bUv784c/zPtq5q1IkaXITkzLNTguQvE8iNlq9Ms20+Ef7+++Efdr9
 5nXU2ozzIvkIwB9u+7fX3j5eldS5KESKiYVtnPvpZjAoQA53FE79GGhqfDMA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=bne-home.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=bne-home.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DA3754030D
	for <nouveau@lists.freedesktop.org>; Tue, 23 Dec 2025 06:11:46 +0000 (UTC)
Received: from outbound.st.icloud.com
 (p-east2-cluster2-host6-snip4-10.eps.apple.com [57.103.78.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB74C10E0DC
	for <nouveau@lists.freedesktop.org>; Tue, 23 Dec 2025 06:19:27 +0000 (UTC)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-15 (Postfix) with ESMTPS id
 7285118000A0;
	Tue, 23 Dec 2025 06:11:01 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=PgFncF/RAuPmSd/ndbWFGHlEySnfTyAhpN6Jo23lMt0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme;
 b=dkPNA7ixGNjp6V5Mf3oPEYh6bIgPuETaNIcRLNKqGPLfXL1/WlYAksqTjp3El6gfil25yHPM+jzlJQJaLs1HYAAAuaHDWuoYm6b5NguMsEsuYuOTEVD7n2vmziM+nzaOJ6IW3pfQIztJLgD3k0lN9RxU9aldHIzi4ZOyUOZP/lEw3q3C/rP83LXI4nX2xcdTKuAjeM5SHpJm0LI1JIpZ+PuIRLbrhVyUVP/fEuYlCIZm1uePevW1oapw3RzeqJzVsLxsf/NZpnse+3NBKd7QGG8DMvWfjkUdDy+NSmA5eO3lmPm99vC8paYX0JJRcOZs+k+KkKucRiojGs+KmEQhjw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-15 (Postfix) with ESMTPSA id
 003DE180009F;
	Tue, 23 Dec 2025 06:10:58 +0000 (UTC)
Date: Tue, 23 Dec 2025 16:10:55 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v4] drm/nova: Align GEM memory allocation to system page
 size
Message-ID: <aUoyb9BcnYS0xp8f@fedora>
References: <20251215083416.266469-1-bshephar@bne-home.net>
 <DF1DDD8BUIYQ.1YCAA8T6557NP@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF1DDD8BUIYQ.1YCAA8T6557NP@nvidia.com>
X-Proofpoint-GUID: qrFTykA8JDHO5cXb2BsBDRPj8ldWf9Iv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1MCBTYWx0ZWRfX9/eoxI1WLkk8
 SRzMXAOA3mK5OdYUW0I5MYgeNffdMLh6X3Uuo6yb94o5hBn9u5wpNaAd1emZDzfpXNERZNu5yTo
 Lvn9OHqh4tZQ0svCJS8N3QalBFj1bZJqISvLjiKdFvt57SjX72v11sVwcvqmmKcmaZ6DoTXfwf4
 l+l6NbJfe1XlCZkbfS/Tvl6nDyWjajMYeVc2X1CEpQ3ahy10FWo/xVzkf/UEBIxTB7FRaBecCOl
 pX/dc0cAkUzc6iBXBCNj5tqFHrWKIXF/QzC117lfQYeUf2JwpgNQrFsrA+N32zKIX/GzZfQGvuT
 DpVFISwDg1LKicXnj4b
X-Authority-Info: v=2.4 cv=BJG+bVQG c=1 sm=1 tr=0 ts=694a3276 cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Tqo27WzTpzf5rUx77aUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: qrFTykA8JDHO5cXb2BsBDRPj8ldWf9Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 clxscore=1030 mlxlogscore=714 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512230050
X-JNJ: 
 AAAAAAABrBUh0yJo2WecKsw9Hv3boXtZQNEIRW4PhSyfeYiRT8qVuab8LUmVdCsRfjA1SWwhz+kAi9d2GfcZy1oQxF0AgF5nLnwwDxGYMj9UJufxAj/2RA6V4zXbfk1yDPZcY2rEudqjhH+btUbf0Nr+d8mFa2mGR/y0NHjB0vJgO9aM8mcoPlj3SvM46gi8Q7gBq33xqQxrD+qspyQW8Na/hHiGcA0h/TCJaHlUBsctrK2TTqIlPNCPAjLuggR87MJU4KDs7dxz8UIK3Rn3BpSB56ggs3ls1CAekOi+3AgjNyl6z6ZzlCxM03UKrsPqSXk4oLYOl3B5zJDJCxMYa9L+WOhX0cvOcaLjCND+3DAOFjvh/3e5mkps6/5cAYtWP9qVsyLRF+bjQqBlqDh+Qoi6SHuLN9VdaJ8nX+1ByKn52KsDNxX907rqgJA2A1vA46LvuAf0zXLCZS4twlebskemMsa/XdcHRPiT2uea1Z4MgSy71Wl4D8/xM2VnlBo++J2kbozqV4x9RvnrS5UVZv80A/AqojIpbRL6jS4Zvjn5jEESbyNJtIAS1B+FXe/pq6Sv5+llzztd8c4bmXtPS3etG1jg+USziuU0FrnLjWXZllYKLojLBva+4naVvQgSWEGSmiSj5L2rgzW8c/SuI66H/WmEQrmo8z01w8bYeSRi
X-MailFrom: bshephar@bne-home.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: SSQWHKGVQ5YBUNQYJICRZBBLMYDYPI5W
X-Message-ID-Hash: SSQWHKGVQ5YBUNQYJICRZBBLMYDYPI5W
X-Mailman-Approved-At: Tue, 23 Dec 2025 16:07:55 +0000
CC: aliceryhl@google.com, joelagnelf@nvidia.com, airlied@redhat.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SSQWHKGVQ5YBUNQYJICRZBBLMYDYPI5W/>
Archived-At: <https://lore.freedesktop.org/aUoyb9BcnYS0xp8f@fedora/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Dec 18, 2025 at 10:16:48PM +0900, Alexandre Courbot wrote:
> On Mon Dec 15, 2025 at 5:34 PM JST, Brendan Shephard wrote:
> >  impl NovaObject {
> >      /// Create a new DRM GEM object.
> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> > -        let aligned_size = size.next_multiple_of(1 << 12);
> > -
> > -        if size == 0 || size > aligned_size {
> > +        if size == 0 {
> >              return Err(EINVAL);
> >          }
> > +        let aligned_size = page_align(size).ok_or(EINVAL)?;
> 
> nit, but it's a good practice to always leave an empty line before a
> block of variable declarations.
> 
> >  
> >          gem::Object::new(dev, aligned_size)
> 
> ... or if you prefer to avoid the variable altogether:
> 
>     page_align(size)
>         .ok_or(EINVAL)
>         .and_then(|size| gem::Object::new(dev, size))
> 

Sounds good, I'll use `and_then`. I like the idea of not unnecessarily
assigning variables just to use them once. I'll make that change, re-test
and send a new revision of this one.

Thanks!
