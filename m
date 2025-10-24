Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C687C07C81
	for <lists+nouveau@lfdr.de>; Fri, 24 Oct 2025 20:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8353010EB2E;
	Fri, 24 Oct 2025 18:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="W4hPMr49";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6B10E221
 for <nouveau@lists.freedesktop.org>; Fri, 24 Oct 2025 18:38:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-63c2d72582cso4148010a12.1
 for <nouveau@lists.freedesktop.org>; Fri, 24 Oct 2025 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1761331115;
 x=1761935915; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SehxGFf5RI+QNApRbl8Q/HaZF1Kv4u2TFfr5KHjmZY8=;
 b=W4hPMr49LQeaRFA66HWjH1TfNT3xNGe/001qBDkuXvkh4Rr4smfCZmefMOyFsVjKrz
 M9+5jzjhOdhQx3Je5pyJLchZQdicrrl0LOQd2ijUb8rxuMBKfxJknwsQsXAp6uYdplwa
 F77Wl7EjzTWCW7rajukwcNZqTUp1UHfmXCpeGHvScbI0wQ8OKknv9aH9zhH4K5eptiPK
 6evoTBiDp1Om8Jo1o8C+YaSwBfVqcErmWg/Te3gQoaqZznuUcjb/d6ZJz43LNlhjBf/u
 twgFygmsuvYC7Vi47am05KAJqYP7urNkMdDYqVxW9GsZhX4qRi0a75uK5a0/D+wEW9J8
 v0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761331115; x=1761935915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SehxGFf5RI+QNApRbl8Q/HaZF1Kv4u2TFfr5KHjmZY8=;
 b=cEhWEIx+7Srje0xNjqloz4rRZOl89Q8d/wc1jLjb7/bEnkXDVLHyD+qG7c6QwYmTCM
 zcCzxpmrvyoRRsjroGW0KP8rTgzb9Dm32WlMasJQxdI2Ajem+QmqsToSJBIDQbN3hyHp
 IIamAy0LcFUZtD4fdnkmxKSwl1Dhg7s61g6PGvB0RrwaKkjX6MpCBx8Q7O7tVs+bDYjs
 XJCnVga8elHpseTW8nhmx9RUK90r/wwa9C1KEm1GOVQHb3DTh/VDok77YFkznkkFJ7+q
 IxAfBDcU3BzYNSGFZjvMw3qcCAhhKBHDg+psCKSY4fVEKrM3rYVCFcvI0GtO64Znpsv4
 fAew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX54kWBgD0leBWJnq5+Yvac/aI0z6VlHP7pXQb1SkWsFonPTOO9A2S/r6mW4pIi4qfvvkTSXoAj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSaf+usz4JDQUaW6IrKeviRis3RTzvz8cekyEIcmwTae+Jqkkm
 fVIKChZDMBy402z+TLwGNQXI+WjlLpXZl0/P3i9PhKt1bvOHHi6sPLDS/APx6+f4Seqzx2yrpO2
 2ETFjrlW1BycOv0NC0NcBF9a8iieOjcnaqUk0du6qDw==
X-Gm-Gg: ASbGncusRwapF9J6C/f7LvLDirRWdyQQysj6V1hmvGXITvuF35aazPIy4CK1M8vhQRJ
 WyGPk4ma9D7W6gPniGUDgzT4li9yT5l6mcpHe3b8xdqERORs8IrjeiZrgJc8A5l11CUWRnI2PGA
 PKoENDdPGqcGKiWd2CASlR6J30woaaFaRKBI238q91NO3eQTynaOnQ0cLpYP/CKfApymsnK6XCJ
 GEjfRsTUKdtS1t0t7kjcH7ISr/kNHnhiTI2mzyoNghlwVfAUO/9v4XkLRML
X-Google-Smtp-Source: AGHT+IE1vxC1Uwjj8R8CM1AWbxojRAD3IvgvngS7zRhcGLQcsfz5Kuv+JEHnlpy2xp8g/pOMb9xkDE45L8O5xqHHD+I=
X-Received: by 2002:a05:6402:3586:b0:63b:d7f0:d93a with SMTP id
 4fb4d7f45d1cf-63c1f6364c8mr27858987a12.3.1761331114665; Fri, 24 Oct 2025
 11:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
 <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
 <CAA+WOBvVasy2wRP_wmP-R6Q8y5B4sN08jNYfHuDVjiWXV+m23Q@mail.gmail.com>
 <904ba70f-b1bf-4745-8e92-d27a6c903673@kernel.org>
 <CAPv6GL2DQ_wY=r4eV_V=nBGaj20HtYzRfJg==rQJtuO8Fo+HAg@mail.gmail.com>
 <CAA+WOBvfStqh+HTXYrrD_=YUXPYNaKLgHPLQ9g07gfQmAXKAWA@mail.gmail.com>
 <6bfd10e6752cd682e396fe14a367885a26346568.camel@redhat.com>
In-Reply-To: <6bfd10e6752cd682e396fe14a367885a26346568.camel@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 24 Oct 2025 14:38:08 -0400
X-Gm-Features: AS18NWAt5obvzBW50pR65D8rfSGongK4bck5mMwpTRAiNvffKJwTezyBXT3yoSA
Message-ID: <CAAgWFh3rMwAwcaSCYsyaM0Q+yT5pf=teLQsAUJYyUbVHRQYjBQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: Lyude Paul <lyude@redhat.com>
Cc: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Mary Guillemard <mary@mary.zone>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 23, 2025 at 4:52=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
> One other change we should consider making though: can we make page_shift=
 32
> bit? A page shift of 32 would give us 2GB pages and I think that sounds w=
ay
> larger then anything we'd expect to encounter. Plus, we could just warn i=
f we
> get a page shift larger then 32 bit and fail the ioctl. 64bit % 32bit sho=
uld
> be faster and at least alleviate some of the overhead from the math here.

If the 64-bit modulo is a big concern, then this could also be
re-written to use bit arithmetic like this:

static bool
op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shi=
ft)
{
        u64 non_page_bits =3D (1ULL << page_shift) - 1;

        return op->va.addr & non_page_bits =3D=3D 0 &&
               op->va.range & non_page_bits =3D=3D 0 &&
               op->gem.offset & non_page_bits =3D=3D 0;
}
