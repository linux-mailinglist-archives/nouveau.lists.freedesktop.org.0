Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3A2932E1
	for <lists+nouveau@lfdr.de>; Tue, 20 Oct 2020 03:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47D6EE60;
	Tue, 20 Oct 2020 01:54:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827E6EB86
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 23:05:49 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id k25so49620ioh.7
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KZcwJitFojA7RhzeD/UU8gbzehCBdvf6g5ia0ZYCrq4=;
 b=R0THCPfeT+NjRv5n7wRuWr3+iQQVH5mYQugrcFEorv7jMlZOJpq4gWO8x2sltRZ1S3
 8+uXkfK+0xraFRPc7RLEyC+L1Eqn+lwfgcQ60rCu3Ir6T0iqCUlHxkXPI8IxQxljNihW
 MxA7dERE+Fo0B6yhfEPLGm6gbjuMrGvt0ee7i4ozPAa6C0OwTV1SJBaz+sj8rzyyiIix
 DQ1LhxNguLsVQ2r9xWcmCur9QDHoeimXQtC/UVpN+4Yl8O9ZbpYKUwlrKFZtzYHwjpgZ
 iC+kREvCZvwgmOBCIm7DmgxG6/6ncKrp6QDCnbxkp/qIzrhuMyauJsg53LWTp//HSslk
 z+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KZcwJitFojA7RhzeD/UU8gbzehCBdvf6g5ia0ZYCrq4=;
 b=lNwDbyUeXndWdl+/xy29FPJc/qdVQcL5JVfb/IYdMRkTtQUsLDu/xKpwTfQ6tIsFcS
 Br3LWwQDm5G+nMY1gP0Ny3TcfjzGZDDEcWfZbzM9RjD5m51mvZIPtHVEBwNMR/iCijF2
 hXAV17bI/0SoxktwJaSYUGAeHWzwD9Ql+ohl+y7e62ny4wvbKm/YRSvranxR1h49RBvh
 /dNJePIzxNrYYPamKMHf0eiHv647m3I1i0yaNh7wWtRP4zUsfGTZ2DmB7Phy920Qeo7p
 VeuKRJu/r96RgG9bKmc7hK4muF8v6GULvKJjYKXSnhNiqJN2iqN10+zccXrqrzrQm8R2
 +gqw==
X-Gm-Message-State: AOAM532Q5R9dJYrGHMsRYRe0eENRW66uRuiBURtCsqE4QpUdx+X0IYY1
 aus3o36aaynepE5ns+hzRRN+QA==
X-Google-Smtp-Source: ABdhPJwE/qhLAedndnNRaUrUDMs331Onaq8Iz+VDEVRJN+4h4B5ckC67pNXDnvS9MRF/DxLJjNlnIQ==
X-Received: by 2002:a6b:5019:: with SMTP id e25mr44377iob.123.1603148748578;
 Mon, 19 Oct 2020 16:05:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id u8sm7938ilm.36.2020.10.19.16.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:05:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kUeDq-002hRf-LL; Mon, 19 Oct 2020 20:05:46 -0300
Date: Mon, 19 Oct 2020 20:05:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20201019230546.GH36674@ziepe.ca>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
 <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
X-Mailman-Approved-At: Tue, 20 Oct 2020 01:54:46 +0000
Subject: Re: [Nouveau] [RFC] treewide: cleanup unreachable breaks
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
Cc: alsa-devel@alsa-project.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, storagedev@microchip.com, linux-pci@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, industrypack-devel@lists.sourceforge.net,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-nfc@lists.01.org, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-integrity@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 George Burgess <gbiv@google.com>, Network Development <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
 bpf <bpf@vger.kernel.org>, ocfs2-devel@oss.oracle.com,
 linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 12:42:15PM -0700, Nick Desaulniers wrote:
> On Sat, Oct 17, 2020 at 10:43 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > >
> > > This is a upcoming change to clean up a new warning treewide.
> > > I am wondering if the change could be one mega patch (see below) or
> > > normal patch per file about 100 patches or somewhere half way by collecting
> > > early acks.
> >
> > Please break it up into one-patch-per-subsystem, like normal, and get it
> > merged that way.
> >
> > Sending us a patch, without even a diffstat to review, isn't going to
> > get you very far...
> 
> Tom,
> If you're able to automate this cleanup, I suggest checking in a
> script that can be run on a directory.  Then for each subsystem you
> can say in your commit "I ran scripts/fix_whatever.py on this subdir."
>  Then others can help you drive the tree wide cleanup.  Then we can
> enable -Wunreachable-code-break either by default, or W=2 right now
> might be a good idea.

I remember using clang-modernize in the past to fix issues very
similar to this, if clang machinery can generate the warning, can't
something like clang-tidy directly generate the patch?

You can send me a patch for drivers/infiniband/* as well

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
