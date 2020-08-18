Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B506B248FEB
	for <lists+nouveau@lfdr.de>; Tue, 18 Aug 2020 23:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB3E6E156;
	Tue, 18 Aug 2020 21:07:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E59C6E156
 for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2020 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597784851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GoU9/TmuxoijZ4J8PlBFbGoF9UT1uTbQAHLccInlP/E=;
 b=L0Z/PWlMmMk6JCoVP84iGUCDBFfAFaQ/xk0doo9go2pKkbjUJIxKxYFO9HBGlt+998br36
 7GQESH3pB1RIrUQiqYGpZIXZ24H3qjTD7Af1hkSUWIe8QnVSpP6ey0TuXsRn+BShBkeE6r
 f1B/o6AouWoiI9Bb5Ua5RgQkjy2E62E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-pPZZXdCLOW-bcl-V8WnEUg-1; Tue, 18 Aug 2020 17:01:20 -0400
X-MC-Unique: pPZZXdCLOW-bcl-V8WnEUg-1
Received: by mail-qk1-f200.google.com with SMTP id 195so14014231qke.14
 for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2020 14:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GoU9/TmuxoijZ4J8PlBFbGoF9UT1uTbQAHLccInlP/E=;
 b=WZWrm7E+Yel8D5fQB5SKNB0Xv1a66kUavU6ax9J7VeCbU4PNRckF2Ao2d5N0AHsoSC
 ayENXW1PmUpbTrA+XRPPugSM4O8Hdsj2XSFu0eCz4wdXOjwxYLwzXgsqzgiDlbux+R75
 S0LFixh9lMsHtbUJj6S5is+7OGguI7umedEDwYmPGjxnJ13PsIFRwizET9dsjAfg7s5v
 mIc3UAAjaVEKdaWN0ClPq3CuYOrv3DTIq9RhekkBDJaxAfi5RvMqZdJfrZbFKd1lKWK/
 rorD3I8vZj66OYD+hmlvUIHBqNwldKKiY3g6kUWLE2W2CYMTQlsSPPQMNRuhl8bq7ixX
 cr7w==
X-Gm-Message-State: AOAM533cF+Hx6lIwlp+iHDb1e4Jja8mNafq/etYw3JpuPyt/5j7FxKvw
 Dyp3C9RyAL4p55mEeboT48pAUPkUwWmZbWmMsBZDylA+k4QdBpNQKf6iZL8hJpwogF0eXJTcY6f
 9BqlRrPG7Lr+5Jsvrp9/3OLsL5g==
X-Received: by 2002:ac8:1c82:: with SMTP id f2mr20241977qtl.305.1597784480230; 
 Tue, 18 Aug 2020 14:01:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4/JMm0AHRvsSmRQYxmHZJmVE0rsdzL8WJabGXvnAI6QuUE2OP7X3R0bKB69oqd9vpOk8v0A==
X-Received: by 2002:ac8:1c82:: with SMTP id f2mr20241957qtl.305.1597784479977; 
 Tue, 18 Aug 2020 14:01:19 -0700 (PDT)
Received: from dev.jcline.org ([136.56.87.133])
 by smtp.gmail.com with ESMTPSA id l189sm22069102qke.67.2020.08.18.14.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:01:17 -0700 (PDT)
Date: Tue, 18 Aug 2020 17:01:15 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200818210115.GA53828@dev.jcline.org>
References: <20200417211025.109574-4-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200417211025.109574-4-lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [i-g-t, v3,
 3/5] lib/igt_debugfs: Add igt_debugfs_pipe_dir()
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 17, 2020 at 05:10:23PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Like igt_debugfs_connector_dir(), but for pipes instead.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index bf6be552..3c3b11e1 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
>  	return ret;
>  }
>  
> +/**
> + * igt_debugfs_pipe_dir:
> + * @device: fd of the device
> + * @pipe: index of pipe
> + * @mode: mode bits as used by open()
> + *
> + * This opens the debugfs directory corresponding to the pipe index on the
> + * device for use with igt_sysfs_get() and related functions.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_debugfs_pipe_dir(int device, int pipe, int mode)
> +{
> +	char buf[128];
> +	int dir, ret;
> +
> +	dir = igt_debugfs_dir(device);
> +	if (dir < 0)
> +		return dir;
> +
> +	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
> +	ret = openat(dir, buf, mode);
> +
> +	close(dir);
> +
> +	return ret;
> +}
> +

There seems to be a lot of overlap between this,
igt_debugfs_connector_dir(), and igt_debugfs_open(). As far as I can
tell, the latter two functions are completely identical so it's unclear
to me what the advantage of using one over the other is.

If I'm not mistaken igt_debugfs_pipe_dir() could be reduced to:

{
    char buf[128];
    snprintf(buf, sizeof(buf), "crtc-%d", pipe);
    return igt_debugfs_open(device, buf, mode);
}

and the docblock could just note it's sugar for igt_debugfs_open().

- Jeremy

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
