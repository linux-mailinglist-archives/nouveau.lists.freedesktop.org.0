Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E73C38350
	for <lists+nouveau@lfdr.de>; Wed, 05 Nov 2025 23:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132910E7B6;
	Wed,  5 Nov 2025 22:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aBNjWUL1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32010E7B6
 for <nouveau@lists.freedesktop.org>; Wed,  5 Nov 2025 22:34:55 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-ba599137cf8so308994a12.0
 for <nouveau@lists.freedesktop.org>; Wed, 05 Nov 2025 14:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762382095; x=1762986895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9YdcX48Lm+WvofyNz3S/WPJ9jf2nNHMhjPdKCdpwJM=;
 b=aBNjWUL1Eb6ikBQo0Q4T7aJqsRtq4Typ80ZS9CcZHdXzY8mEpMVFuklmNdgccsDXl0
 sWhIAEmYFy/+g3ebJ8GLIM8K8UhhlhLcsAtE8oR4b3AnflcWp2rHWl3bvdW+9QbqajHB
 Po2knLEUB9NMMva+Cc5POLGCuAq9IPpAJYqRqFUTeS+RHU7VSkE9eflpcDhX29+dO89o
 XpLu087A1Skz+RBkUDJY0O6luoaHWMbaCHjpWmn2h8m/FAcl3pDu7agpL7ZSfEtRw+Lj
 J1F0j1PwNsEW0nf23CZj81xMokb2bot/E3ifzxPqAZx5sxYwOX/cDMJnxCjhmmSk7Wc9
 F0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762382095; x=1762986895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m9YdcX48Lm+WvofyNz3S/WPJ9jf2nNHMhjPdKCdpwJM=;
 b=wdGazPkjnb7QjAtS7WCr7Ii3/UKDHUi9z+9JrtTXUu5zZdwJqIdXpGXrzsPjP2Xi3o
 8SxnfGvGQ3CvImgPUBBdOoUhs/S8Sw6dryGAwR8/OeXaq2mCOdXsawEUJuZDpx552xWz
 JSEYL6G5MOowxj1FyEIdLOvfbmzZJl00xUZt9IueUIM6H4nao6YAj78j1zKLVDw5DJER
 tm6GQF7t+zxA5kT5fqnbmyS/epZ2s4dBBdYvdmJZsaNOS7yqET9Y0ECbpkaVlNqt9Pmh
 OnzKNHxQSmXbCXOzuTJIYRGkUpjv40aGZYWmy3KNBtcZaZnhT7CftgxB57OXi1e4JwdF
 wTwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBAvItgNqAai7xE4+mrKlEyqQEbPRzm7ddRYibGg/SVu85aHG3/CkEDEHYfDYXKMhLCr8sifoZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGy0nsUU0F/Qmu/AywKc4QGkLpwTTLPWekbdCWDHZlhvL9Gekq
 xb3jJ1gaen2uLjM2s2zengdTlN0qF0IpvxQoaP+wTX9gk5dCET7fBf6UvUFPwGPhdTxAfL1gYxE
 J9a2lToPqSCT+URXexEgHf38ogqC04IE=
X-Gm-Gg: ASbGncuhQYinQtHL8T1zaGwaglqrInnsbYYHo2RlyDUOmLT9kWDa2wwsGYfVevOpM8x
 rVS2F7xnioWOOhuksqSUb5gWeIi6ZbpsUQBsulSEm15r6dEFI+bv3xlsWcQJM5o3Gfd2eqruNs9
 qv8lWEli4vlHdKzTCIpgdWLyYKMu5n1MvbTnTOfztclJUtpXizQd1BCm7zxcYdzP7lvH19WoTHG
 GDYS3EgJgXgWQvcFfa8v0hK/a3Au5ucYRXbnRy4FRS1wn5cr4vrIYE2SoshZkn5RHGGYCUp
X-Google-Smtp-Source: AGHT+IHIHO30gWfFa2a8pQjfVD3lzjmNd22UhsmtrAsEPwyuVl9HAZlkCocO18RYcmuCLRaX9tmJc35cZ/AJdbxawtM=
X-Received: by 2002:a05:6a20:9f8f:b0:346:3d90:84dd with SMTP id
 adf61e73a8af0-350dcb3337bmr950104637.1.1762382095117; Wed, 05 Nov 2025
 14:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
 <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
 <209ea5680e5ca28b6d068ef8e0b58613c93bf525.camel@redhat.com>
 <CAAgWFh2Zy=9vt6x4e3P6G+_RV0Hu66jyJjpKWWx4WVg8EAV+Ng@mail.gmail.com>
In-Reply-To: <CAAgWFh2Zy=9vt6x4e3P6G+_RV0Hu66jyJjpKWWx4WVg8EAV+Ng@mail.gmail.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Thu, 6 Nov 2025 00:34:43 +0200
X-Gm-Features: AWmQ_bk6WW3AO_AvnnWBICE7NGsiAPsdu5CZJbslfDarF5t2N6XtYRBJjhG5NGs
Message-ID: <CAA+WOBvmq_LkT97v+5Pnno7_OPWOMewew4j2dbLdcLvxNnGOjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
To: M Henning <mhenning@darkrefraction.com>
Cc: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
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

Do I have to make a v5 with Lyude's and James' review tags or does
this get added when it lands?

On Thu, Nov 6, 2025 at 12:33=E2=80=AFAM M Henning <mhenning@darkrefraction.=
com> wrote:
>
> On Wed, Nov 5, 2025 at 4:01=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
> >
> > As long as you fix the parenthesis issue in the next respin of this ser=
ies:
> >
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> There's already a v4 on the list that fixes the parenthesis.
>
> Anyway, if I'm keeping track of things correctly this series is now
> fully reviewed (v4 on the kernel side by Lyude and James, and on the
> userspace side by me) which means I think we're ready to start
> landing.
