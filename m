Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A4AD6EA3
	for <lists+nouveau@lfdr.de>; Thu, 12 Jun 2025 13:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6197C10E7D5;
	Thu, 12 Jun 2025 11:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gmMv+sXf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0310E7D5
 for <nouveau@lists.freedesktop.org>; Thu, 12 Jun 2025 11:10:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so132279766b.0
 for <nouveau@lists.freedesktop.org>; Thu, 12 Jun 2025 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749726652; x=1750331452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nBrpMK9zZeZHFNOhk7Yg3FOCL/mJbGGTtA0TEp4ISs=;
 b=gmMv+sXfJgUSTcsJ88LET0uag2aw1wro09lEAGD8mtXi9g9Git6idRC+EHGKUJRn9o
 TTp7eaZmKPbvd80E6tQnqLouOoYeqH9VbRtYGYxYXBTDnTpkAhGocNpF9XqXSRkW/QTt
 vbL2VrT6rzKxZAmrvm8jOwLZ5MJnOKjR9YAnJWF5YwK3OfDNuw6FBd9SZ5sSQhUFhh4e
 mK/N7U10D9ploMyR3gjR9eLWwUWlZQ7GVavQPoEfvVyglXWBBHq7yHt9hRkrYIbMOQla
 ZlPxUP3zQxdy7/iPFhA24AhRzoc4ipvz1jt/xnWGG+k15TsiGnph5UeI6xbwI11drGf4
 9A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749726652; x=1750331452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nBrpMK9zZeZHFNOhk7Yg3FOCL/mJbGGTtA0TEp4ISs=;
 b=hMbwhGe303vFuoVA9gaWpKixyEh65PRBazJ6FLiR1rsx5vXH2ODFJbJ1Ej4gvQLPUI
 g0okGOtb1xYWYpgBkstLzL2YC0S8IF80S/0VcAm5AmoufzYEs4MoIGpoZqwkCornHeSL
 yeo9R58H/ESNSN0GbVGsmB53xy68YvAKEwxirtROQ71VM0gOLI+5hj0ucQXXQC+7jUJr
 Q4l4LsEIVSZvVXwq3brtOziax5URS8r75hfy/W/vh4ZJs7lK8N+1DnJUETi0zImrtslK
 Do8cHIDJgzlWJKLVxoi76e5u0+nJTXjmRyAecpCTJdOffYM4N5cCUGL9ZWsm5EaXrP44
 BXiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQtxoux7BVk1txb7I2kdsi8IwPFe+2ubKqJ+FWGWlTdjrLcQLMZEZ1Y190mxachYYjOmRlz+hM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyaf2J1vkrioKs7na9WyNGuleFtWziLbApquk5oITAV80Jhxbjf
 n0yYGE+dLKh4BgQWylR4SznDDi5gFic+WnHnaZ+Jhbr5WAXMtL1ZEL1JUgmEktImMJv7WpFnBIq
 XjXsv2iIyDTsB0sbQhqeVJIaJADsBWoA=
X-Gm-Gg: ASbGncs7m5RX2QxY+IuBNHlCiwU6wG96mdxSgr4D5vUmJErGIph6bfIgPWPNGk/oY5V
 NSoENbpNOv69AHb7+gGPQB7yHt/6aBnWKR9k78QaNuKZkyrkc+O6Zi4pmtYc9QplkpPbLQf+xBR
 8uMCEaefAmeHIcDatZtVDp/WPnOnO+8nG0+JHYo8/9l1A=
X-Google-Smtp-Source: AGHT+IFrX17XfYVkjVnepz8BihCrbdN9elHb1a1FwyoMbX0yLjH2EltV5lWsECJ7oLshTrIE21PMDORFUypei4zXNLs=
X-Received: by 2002:a17:907:980f:b0:ad8:a515:767f with SMTP id
 a640c23a62f3a-adea9464061mr258576566b.51.1749726651742; Thu, 12 Jun 2025
 04:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250612093228.7655-1-chengzhenghan@uniontech.com>
 <84b14425-03e4-42be-8bd5-9bc010ebecda@suse.com>
In-Reply-To: <84b14425-03e4-42be-8bd5-9bc010ebecda@suse.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Jun 2025 14:10:15 +0300
X-Gm-Features: AX0GCFubP_i495cQIkoSGfjK4G9pwjz7TYfQyvgZfj4JA8pwuaopIL7tecp4u7I
Message-ID: <CAHp75Vc7AO_sRgB1Nj6CevbseMFyv5ku8ZS3PwzAuAgysKVxNg@mail.gmail.com>
Subject: Re: [PATCH] x86: Fix build warnings about export.h
To: Juergen Gross <jgross@suse.com>
Cc: Zhenghan Cheng <chengzhenghan@uniontech.com>, tglx@linutronix.de,
 mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
 mario.limonciello@amd.com, yazen.ghannam@amd.com, jpoimboe@kernel.org, 
 tony.luck@intel.com, jarkko@kernel.org, bhelgaas@google.com, 
 pbonzini@redhat.com, oleg@redhat.com, jbaron@akamai.com, ning.sun@intel.com, 
 seanjc@google.com, luto@kernel.org, andy@kernel.org, jim.cromie@gmail.com, 
 kirill.shutemov@linux.intel.com, hpa@zytor.com, 
 pawan.kumar.gupta@linux.intel.com, vkuznets@redhat.com, rostedt@goodmis.org, 
 ardb@kernel.org, thomas.lendacky@amd.com, nikunj@amd.com, 
 ashish.kalra@amd.com, kees@kernel.org, alexandre.chartre@oracle.com, 
 rppt@kernel.org, steve.wahl@hpe.com, jirislaby@kernel.org, 
 apatel@ventanamicro.com, bvanassche@acm.org, ptsm@linux.microsoft.com, 
 Jonathan.Cameron@huawei.com, beata.michalska@arm.com, xin@zytor.com, 
 davydov-max@yandex-team.ru, ravi.bangoria@amd.com, joel.granados@kernel.org, 
 ffmancera@riseup.net, kprateek.nayak@amd.com, akpm@linux-foundation.org, 
 bhe@redhat.com, brgerst@gmail.com, coxu@redhat.com, dmaluka@chromium.org, 
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
 linux-sgx@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux.dev, tboot-devel@lists.sourceforge.net, 
 nouveau@lists.freedesktop.org, linux-coco@lists.linux.dev, 
 xen-devel@lists.xenproject.org, Huacai Chen <chenhuacai@loongson.cn>, 
 Zhenghan Cheng <your_email@example.com>
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

On Thu, Jun 12, 2025 at 1:19=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 12.06.25 11:32, Zhenghan Cheng wrote:
> > After commit a934a57a42f64a4 ("scripts/misc-check:
> > check missing #include <linux/export.h> when W=3D1")
> > and commit 7d95680d64ac8e836c ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=3D1"),
> > we get some build warnings with W=3D1,such as:
> >
> > arch/x86/coco/sev/core.c: warning: EXPORT_SYMBOL() is used, but #includ=
e <linux/export.h> is missing
> > arch/x86/crypto/aria_aesni_avx2_glue.c: warning: EXPORT_SYMBOL() is use=
d, but #include <linux/export.h> is missing
> > arch/x86/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #in=
clude <linux/export.h> is missing
> > arch/x86/kvm/hyperv.c: warning: EXPORT_SYMBOL() is used, but #include <=
linux/export.h> is missing
> > arch/x86/events/intel/core.c: warning: EXPORT_SYMBOL() is not used, but=
 #include <linux/export.h> is present
> > arch/x86/events/zhaoxin/core.c: warning: EXPORT_SYMBOL() is not used, b=
ut #include <linux/export.h> is present
> > arch/x86/kernel/crash.c: warning: EXPORT_SYMBOL() is not used, but #inc=
lude <linux/export.h> is present
> > arch/x86/kernel/devicetree.c: warning: EXPORT_SYMBOL() is not used, but=
 #include <linux/export.h> is present
> >
> > so fix these build warnings for x86.
> >
> > Signed-off-by: "Zhenghan Cheng" <chengzhenghan@uniontech.com>
> > Suggested-by: "Huacai Chen" <chenhuacai@loongson.cn>
>
> For Xen and paravirt:
>
> Acked-by: Juergen Gross <jgross@suse.com>
>
> Your patch is looking a little bit strange, as the list of modified files
> is located between the patch hunks, followed by another "Signed-off-by:".

Indeed.
And at bare minimum please split at least to two:
1) adding export.h;
2) removing export.h.


--=20
With Best Regards,
Andy Shevchenko
