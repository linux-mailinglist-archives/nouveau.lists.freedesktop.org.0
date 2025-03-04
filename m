Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D5A4ECFF
	for <lists+nouveau@lfdr.de>; Tue,  4 Mar 2025 20:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D515010E6A2;
	Tue,  4 Mar 2025 19:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oTq6rl92";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EB610E6A2;
 Tue,  4 Mar 2025 19:15:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9FCB2A45CE1;
 Tue,  4 Mar 2025 19:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E51EC4CEE5;
 Tue,  4 Mar 2025 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741115727;
 bh=NJ3TQZFfV3q3elNa2NxItYJQTy6CMZkFNGwhlIZAytw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTq6rl92QjtF9LyJG1zuHCWL9z0PN3kj3ItWHL+poQ4CKCDTVvQXuMKeV7omAG079
 A8L0eLtHNrgS21USGn1mmEaLQdRskQobutNrEQkJLt1VnYyGM7XbC0BrHUBdTdFjC0
 yQUPQxUkWsaECSup+PnDHhRyV2SsB4sRbAU8GqJ7fpoI3ApW13x62Q00dqv9QyHZjX
 +SZ1cd+h7r1lEih4uMUidp+oChcTYTVwRsa6rGPtv4PzZviy3kVOY1yOSz67CN/wyW
 rQ0KSaNncpkrMJJsaBzvrm6gUnyM1F7KXHrJWmibu9KoZnIlKaibe5lzTG1Y+hkyIr
 2oYKxMVUDAsXA==
Date: Tue, 4 Mar 2025 21:15:22 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org,
 russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/5] rust: firmware: introduce
 `firmware::ModInfoBuilder`
Message-ID: <Z8dRSp13fsvEF9HR@kernel.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304173555.2496-3-dakr@kernel.org>
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

On Tue, Mar 04, 2025 at 06:34:49PM +0100, Danilo Krummrich wrote:
> The `firmware` field of the `module!` only accepts literal strings,
> which is due to the fact that it is implemented as a proc macro.
> 
> Some drivers require a lot of firmware files (such as nova-core) and
> hence benefit from more flexibility composing firmware path strings.
> 
> The `firmware::ModInfoBuilder` is a helper component to flexibly compose
> firmware path strings for the .modinfo section in const context.
> 
> It is meant to be used in combination with `kernel::module_firmware!`,
> which is introduced in a subsequent patch.

Ditto.

> 
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/firmware.rs | 98 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index c5162fdc95ff..6e6972d94597 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -115,3 +115,101 @@ unsafe impl Send for Firmware {}
>  // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, references to which are safe to
>  // be used from any thread.
>  unsafe impl Sync for Firmware {}
> +
> +/// Builder for firmware module info.
> +///
> +/// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
> +/// .modinfo section in const context.
> +///
> +/// It is meant to be used in combination with [`kernel::module_firmware!`].
> +///
> +/// For more details and an example, see [`kernel::module_firmware!`].
> +pub struct ModInfoBuilder<const N: usize> {
> +    buf: [u8; N],
> +    n: usize,
> +    module_name: &'static CStr,
> +}
> +
> +impl<const N: usize> ModInfoBuilder<N> {
> +    /// Create an empty builder instance.
> +    pub const fn new(module_name: &'static CStr) -> Self {
> +        Self {
> +            buf: [0; N],
> +            n: 0,
> +            module_name,
> +        }
> +    }
> +
> +    const fn push_internal(mut self, bytes: &[u8]) -> Self {
> +        let mut j = 0;
> +
> +        if N == 0 {
> +            self.n += bytes.len();
> +            return self;
> +        }
> +
> +        while j < bytes.len() {
> +            if self.n < N {
> +                self.buf[self.n] = bytes[j];
> +            }
> +            self.n += 1;
> +            j += 1;
> +        }
> +        self
> +    }
> +
> +    /// Push an additional path component.
> +    ///
> +    /// After a new [`ModInfoBuilder`] instance has been created, [`ModInfoBuilder::prepare`] must
> +    /// be called before adding path components.
> +    pub const fn push(self, s: &str) -> Self {
> +        if N != 0 && self.n == 0 {
> +            crate::build_error!("Must call prepare() before push().");
> +        }
> +
> +        self.push_internal(s.as_bytes())
> +    }
> +
> +    const fn prepare_module_name(self) -> Self {
> +        let mut this = self;
> +        let module_name = this.module_name;
> +
> +        if !this.module_name.is_empty() {
> +            this = this.push_internal(module_name.as_bytes_with_nul());
> +
> +            if N != 0 {
> +                // Re-use the space taken by the NULL terminator and swap it with the '.' separator.
> +                this.buf[this.n - 1] = b'.';
> +            }
> +        }
> +
> +        this.push_internal(b"firmware=")
> +    }
> +
> +    /// Prepare for the next module info entry.
> +    ///
> +    /// Must be called before [`ModInfoBuilder::push`] can be called.
> +    pub const fn prepare(self) -> Self {
> +        self.push_internal(b"\0").prepare_module_name()
> +    }
> +
> +    /// Build the byte array.
> +    pub const fn build(self) -> [u8; N] {
> +        // Add the final NULL terminator.
> +        let this = self.push_internal(b"\0");
> +
> +        if this.n == N {
> +            this.buf
> +        } else {
> +            crate::build_error!("Length mismatch.");
> +        }
> +    }
> +}
> +
> +impl ModInfoBuilder<0> {
> +    /// Return the length of the byte array to build.
> +    pub const fn build_length(self) -> usize {
> +        // Compensate for the NULL terminator added by `build`.
> +        self.n + 1
> +    }
> +}
> -- 
> 2.48.1
> 
> 

BR, Jarkko
