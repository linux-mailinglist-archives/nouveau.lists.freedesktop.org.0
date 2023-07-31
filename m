Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C5768A56
	for <lists+nouveau@lfdr.de>; Mon, 31 Jul 2023 05:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F2010E165;
	Mon, 31 Jul 2023 03:30:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E489F10E0C6
 for <nouveau@lists.freedesktop.org>; Mon, 31 Jul 2023 03:30:38 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5221cf2bb8cso6029973a12.1
 for <nouveau@lists.freedesktop.org>; Sun, 30 Jul 2023 20:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1690774237; x=1691379037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XXjUmZvSSABF7x91v5sALvmZTUzg6ZHrv1bnf4BUyf4=;
 b=483K+sSXOsnSrgq2nQDqca4pam50jeHEQp7Ucpf3VfBlZwYxvVc8aRGpByTJjooZb9
 5wavB0piz8pBD8b1o8KxlVwR8fQ+79ZwmcbltU6ZBqvF5BgPA7065j+6UuJ/Czz2R9Ye
 p10gKj2Ee6+JRBlK+gh5caH83CibTbWcavgM17ugFzu2ZqhKDzK9e1jaGfQ/ffMxsse2
 DYwOcdECd9Nv1LU2m3MVWoyLM0MDE73IWLOcwAokHfDRik8EOAvz43o7AQvrBLGMhpNj
 d/E3qCFIEQ3BPR6ouvsXcjHCxiPGWQUOwGTTI8Mjfh2CTMQIeSQ184mFuioAtr7KgWY6
 VniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690774237; x=1691379037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XXjUmZvSSABF7x91v5sALvmZTUzg6ZHrv1bnf4BUyf4=;
 b=jpPCnPc/rWQWR8K08XogSNL2t22sANXrnmRpcqr86Vh8UToELcBGBe4yx0dbP5j2Dr
 XwGGEH5rODHFDpS6k3rCXfH4vaNP1k/VREchVV2cZ6UKD8qG3WQTaoNOzq/HBP4TolzQ
 6MXsys0TMINpbAu8WaXLcfKs+zyBdAGjg/KBXyANf014Jsybd7MvI6OSBK4BRlDoXFxZ
 yjIjjkDV8VqLMw/I1hFSFI0E12FdYkVKEXusY6M/VQ+ci2p3U8bM/xRS2bMVCTxldNB1
 oElTvGF3v7SI59vCYHJd9BfyfsuRensa002urFhoYsC92eFIlFzuZx5F2Vx4L7ss+3K+
 IJww==
X-Gm-Message-State: ABy/qLZKht8COfRwd/69ANOrsdr1ucSEm7eZ0+KVfEAMR7rog/ydWz46
 Dphawx/gRaFg4akjyYg5wRIgFNsj42YXq0rC8p/b2w==
X-Google-Smtp-Source: APBJJlHF5M4+fI8OFNC93qJUHvqSrjQI3+oE19BH8JLW8/IFEVGzhtmRXQ0m0jDzYSHZM2lpnr3llZqfBfC6+nlRWyM=
X-Received: by 2002:a17:906:8457:b0:993:e691:6dd5 with SMTP id
 e23-20020a170906845700b00993e6916dd5mr6450666ejy.7.1690774236973; Sun, 30 Jul
 2023 20:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
 <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
 <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
 <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
 <21ea63fe-33d7-a075-7291-35dd1b2a9b64@redhat.com>
In-Reply-To: <21ea63fe-33d7-a075-7291-35dd1b2a9b64@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Sun, 30 Jul 2023 22:30:25 -0500
Message-ID: <CAOFGe949K6iiQDqdxDPkJ2Zxr=iJ5ad-qLEGb=f1iQcvES+H5A@mail.gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ca63b60601c00d8c"
Subject: Re: [Nouveau] [PATCH drm-misc-next v8 11/12] drm/nouveau: implement
 new VM_BIND uAPI
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
Cc: matthew.brost@intel.com, willy@infradead.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, alexdeucher@gmail.com, boris.brezillon@collabora.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--000000000000ca63b60601c00d8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 5:48=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

> On 7/25/23 18:43, Danilo Krummrich wrote:
> > On 7/25/23 18:16, Faith Ekstrand wrote:
> >> Thanks for the detailed write-up! That would definitely explain it. If
> >> I remember, I'll try to do a single-threaded run or two. If your
> >> theory is correct, there should be no real perf difference when
> >> running single-threaded. Those runs will take a long time, though, so
> >> I'll have to run them over night. I'll let you know in a few days once
> >> I have the results.
> >
> > I can also push a separate branch where I just print out a warning
> > whenever we run into such a condition including the time we were waitin=
g
> > for things to complete. I can probably push something later today.
>
>
> https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-=
track-stalls
>
> It prints out the duration of every wait as well as the total wait time
> since boot.
>
> - Danilo
>
> >
> >>
> >> If this theory holds, then I'm not concerned about the performance of
> >> the API itself. It would still be good to see if we can find a way to
> >> reduce the cross-process drag in the implementation but that's a perf
> >> optimization we can do later.
> >
> >  From the kernel side I think the only thing we could really do is to
> > temporarily run a secondary drm_gpu_scheduler instance, one for VM_BIND=
s
> > and one for EXECs until we got the new page table handling in place.
> >
> > However, the UMD could avoid such conditions more effectively, since it
> > controls the address space. Namely, avoid re-using the same region of
> > the address space right away in certain cases. For instance, instead of
> > replacing a sparse region A[0x0, 0x4000000] with a larger sparse region
> > B[0x0, 0x8000000], replace it with B'[0x4000000, 0xC000000] if possible=
.
> >
> > However, just mentioning this for completeness. The UMD surely shouldn'=
t
> > probably even temporarily work around such a kernel limitation.
> >
> > Anyway, before doing any of those, let's see if the theory holds and
> > we're actually running into such cases.
> >
> >>
> >> Does it actually matter? Yes, it kinda does. No, it probably doesn't
> >> matter for games because you're typically only running one game at a
> >> time. From a development PoV, however, if it makes CI take longer then
> >> that slows down development and that's not good for the users, either.
>

I've run a bunch of tests over the weekend and It's starting to look like
the added CTS time might be from the newly enabled synchronization tests
themselves.  We enabled timeline semaphores as well as semaphore and fence
sharing along with the new uAPI and I did not expect those to be nearly
that heavy-weight so I didn't think of that as a likely factor. I'm doing a
couple more runs to confirm but what I'm seeing right now seems to indicate
that the new API with the old feature set has about the same run time now
that the submit overhead issue has been fixed.

I think this means that we can proceed under the assumption that there are
no more serious perf issues with the new API.  I'm happy to RB/ACK the next
version of the API and implementation patches, as long as it has the new
NO_SHARE BO create flag and properly rejects exports of NO_SHARE BOs, even
if not all of the dma_resv plumbing is fully baked.

~Faith

--000000000000ca63b60601c00d8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Jul 25, 2023 at 5:48=E2=80=AFPM Danilo Krummrich &lt;<a =
href=3D"mailto:dakr@redhat.com">dakr@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 7/25/23 18:43, Danilo Kru=
mmrich wrote:<br>
&gt; On 7/25/23 18:16, Faith Ekstrand wrote:<br>
&gt;&gt; Thanks for the detailed write-up! That would definitely explain it=
. If <br>
&gt;&gt; I remember, I&#39;ll try to do a single-threaded run or two. If yo=
ur <br>
&gt;&gt; theory is correct, there should be no real perf difference when <b=
r>
&gt;&gt; running single-threaded. Those runs will take a long time, though,=
 so <br>
&gt;&gt; I&#39;ll have to run them over night. I&#39;ll let you know in a f=
ew days once <br>
&gt;&gt; I have the results.<br>
&gt; <br>
&gt; I can also push a separate branch where I just print out a warning <br=
>
&gt; whenever we run into such a condition including the time we were waiti=
ng <br>
&gt; for things to complete. I can probably push something later today.<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-=
drm-next-track-stalls" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-track-stalls</a><=
br>
<br>
It prints out the duration of every wait as well as the total wait time <br=
>
since boot.<br>
<br>
- Danilo<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; If this theory holds, then I&#39;m not concerned about the perform=
ance of <br>
&gt;&gt; the API itself. It would still be good to see if we can find a way=
 to <br>
&gt;&gt; reduce the cross-process drag in the implementation but that&#39;s=
 a perf <br>
&gt;&gt; optimization we can do later.<br>
&gt; <br>
&gt;=C2=A0 From the kernel side I think the only thing we could really do i=
s to <br>
&gt; temporarily run a secondary drm_gpu_scheduler instance, one for VM_BIN=
Ds <br>
&gt; and one for EXECs until we got the new page table handling in place.<b=
r>
&gt; <br>
&gt; However, the UMD could avoid such conditions more effectively, since i=
t <br>
&gt; controls the address space. Namely, avoid re-using the same region of =
<br>
&gt; the address space right away in certain cases. For instance, instead o=
f <br>
&gt; replacing a sparse region A[0x0, 0x4000000] with a larger sparse regio=
n <br>
&gt; B[0x0, 0x8000000], replace it with B&#39;[0x4000000, 0xC000000] if pos=
sible.<br>
&gt; <br>
&gt; However, just mentioning this for completeness. The UMD surely shouldn=
&#39;t <br>
&gt; probably even temporarily work around such a kernel limitation.<br>
&gt; <br>
&gt; Anyway, before doing any of those, let&#39;s see if the theory holds a=
nd <br>
&gt; we&#39;re actually running into such cases.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Does it actually matter? Yes, it kinda does. No, it probably doesn=
&#39;t <br>
&gt;&gt; matter for games because you&#39;re typically only running one gam=
e at a <br>
&gt;&gt; time. From a development PoV, however, if it makes CI take longer =
then <br>
&gt;&gt; that slows down development and that&#39;s not good for the users,=
 either.<br></blockquote><div><br></div><div>I&#39;ve run a bunch of tests =
over the weekend and It&#39;s starting to look like the added CTS time migh=
t be from the newly enabled synchronization tests themselves.=C2=A0 We enab=
led timeline semaphores as well as semaphore and fence sharing along with t=
he new uAPI and I did not expect those to be nearly that heavy-weight so I =
didn&#39;t think of that as a likely factor. I&#39;m doing a couple more ru=
ns to confirm but what I&#39;m seeing right now seems to indicate that the =
new API with the old feature set has about the same run time now that the s=
ubmit overhead issue has been fixed.</div><div><br></div><div>I think this =
means that we can proceed under the assumption that there are no more serio=
us perf issues with the new API.=C2=A0 I&#39;m happy to RB/ACK the next ver=
sion of the API and implementation patches, as long as it has the new NO_SH=
ARE BO create flag and properly rejects exports of NO_SHARE BOs, even if no=
t all of the dma_resv plumbing is fully baked.</div><div><br></div><div>~Fa=
ith<br></div></div></div>

--000000000000ca63b60601c00d8c--
