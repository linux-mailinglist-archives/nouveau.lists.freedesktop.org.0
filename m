Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E676F4CE
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 23:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8FD10E66C;
	Thu,  3 Aug 2023 21:47:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3216F10E674
 for <nouveau@lists.freedesktop.org>; Thu,  3 Aug 2023 21:47:44 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-522462d8416so1771031a12.1
 for <nouveau@lists.freedesktop.org>; Thu, 03 Aug 2023 14:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1691099262; x=1691704062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4FMgSn5VFxgRU277o8laJttReSir5sFxEcS6n5PQUNY=;
 b=MG/62O0LVbb0a1LzPJXtC87/memEvVMANxCd46uGDNEvA5EZ0K40CwQ7exvKVeafrh
 YjTeNdWsnojfAO2uFyWWq2Ts7srZHx4KpMsiRQYaFqEEy/6miwiO4jE+U177C65ie/Xv
 ncmZ2PcoLcj/gsVYwDuBMmo1DogH8y6QyH95BkFnyxZ5+ofKru0HDLL9sODuytz1H0wX
 3BNdfPhLoYXfBvdfUxsaQ/248sTRJjMyhCIG0Wi1JlT+tOwZg4qKVfCAiFB6JjG+O5Qa
 KNeqWMzxAT6hV+kUAThAyoOWkrPAzxnLzNH4LuGxjVcuStI3VIXTtpFtmg+iDh3Q9hpA
 ktuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691099262; x=1691704062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4FMgSn5VFxgRU277o8laJttReSir5sFxEcS6n5PQUNY=;
 b=P/qO3c4qg6nWoinqaPAJhDKKYz5Sa4GLBq7UIN+XpD8ads8dhG1IDjTecY7yIC+jo/
 0PpkpWAQt8duA2jeL7Qs63hOc51sjkTKpP6DVfsnPANDziFxBya15SNFH1L34HqrRgE+
 oXi+ahiCzVXprN8EbavK0p857CeTmIuIQwoFFFxXEc9EJby3XeJkuZhuXkTqA1VjtF4N
 NLqB2TLalxb+DKxcFO9hI7dB+o9NSkgAZrp2U71snSCN1e79fT3uTjM31vRViW8z097b
 P1iHmAfrG8vsuryWOqswt0MY+7oeI+V+hUFyWLbFW4Rp1kXTLZsRA398KBeXSTZpBsu8
 Er7A==
X-Gm-Message-State: ABy/qLYthiRBX/wYh/d/bQ9YoxUXbjLaXJGT8VWXLx10+d3HFhhtPj2Z
 Uym2lDhxsXo2V7t8UvnVR6D+dx6koXbd41KZ4e9F0A==
X-Google-Smtp-Source: AGHT+IHlsqcEOvWWsWX/uq9RscGM6ZHBIySCGAKfphpK86CcPRT1Nfh+5oreHHX+C12ZFy6KcN7sgFN9iSPzKIADYXo=
X-Received: by 2002:a17:906:9f25:b0:99c:55c0:ad15 with SMTP id
 fy37-20020a1709069f2500b0099c55c0ad15mr3559612ejc.38.1691099261927; Thu, 03
 Aug 2023 14:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230803165238.8798-1-dakr@redhat.com>
 <CAPM=9tyAD=ZGvgdNDrNpa7BOUnUv7T+6MuTbbtL4jy_ZzXRGkw@mail.gmail.com>
In-Reply-To: <CAPM=9tyAD=ZGvgdNDrNpa7BOUnUv7T+6MuTbbtL4jy_ZzXRGkw@mail.gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 3 Aug 2023 16:47:30 -0500
Message-ID: <CAOFGe94k7yvPuU+XgDscZQG-UwBHE+Vq+mVrBBkXZoFG311_cQ@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c997d906020bbaf0"
Subject: Re: [Nouveau] [PATCH drm-misc-next v9 00/11] Nouveau VM_BIND UAPI &
 DRM GPUVA Manager (merged)
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

--000000000000c997d906020bbaf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 4:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:

> On Fri, 4 Aug 2023 at 02:52, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > This patch series provides a new UAPI for the Nouveau driver in order t=
o
> > support Vulkan features, such as sparse bindings and sparse residency.
> >
>
> Now that Faith has reviewed the uAPI and userspace work, I think we
> should try and steer this in.
>
> I think the only thing I see is the SPDX + MIT header in some places,
> I think we can drop the MIT bits where SPDX is there, and leave
> copyright and authorship (if you like), personally I've been leaving
> authorship up to git, as it saves trouble with people randomly
> emailing you about things you wrote 10 years ago.
>
> Otherwise for the series:
> Reviewed-by: Dave Airlie <airlied@redhat.com>
>

FYI: There's a small, easily resolved conflict with the uapi fixup patch. I
don't care too much which goes in first but I'd like both to land before I
merge NVK so I don't have to deal with a nouveau_deprecated.h.

~Faith


> Dave.
>

--000000000000c997d906020bbaf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Aug 3, 2023 at 4:45=E2=80=AFPM Dave Airlie &lt;<a href=3D"ma=
ilto:airlied@gmail.com">airlied@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Fri, 4 Aug 2023 at 02:52, Danil=
o Krummrich &lt;<a href=3D"mailto:dakr@redhat.com" target=3D"_blank">dakr@r=
edhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch series provides a new UAPI for the Nouveau driver in order =
to<br>
&gt; support Vulkan features, such as sparse bindings and sparse residency.=
<br>
&gt;<br>
<br>
Now that Faith has reviewed the uAPI and userspace work, I think we<br>
should try and steer this in.<br>
<br>
I think the only thing I see is the SPDX + MIT header in some places,<br>
I think we can drop the MIT bits where SPDX is there, and leave<br>
copyright and authorship (if you like), personally I&#39;ve been leaving<br=
>
authorship up to git, as it saves trouble with people randomly<br>
emailing you about things you wrote 10 years ago.<br>
<br>
Otherwise for the series:<br>
Reviewed-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank">airlied@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
FYI: There&#39;s a small, easily resolved conflict with the uapi fixup patc=
h. I don&#39;t care too much which goes in first but I&#39;d like both to l=
and before I merge NVK so I don&#39;t have to deal with a nouveau_deprecate=
d.h.</div><div><br></div><div>~Faith<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Dave.<br>
</blockquote></div></div>

--000000000000c997d906020bbaf0--
